/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ptt_bridge.c                                       :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: julmajustus <julmajustus@tutanota.com>     +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2025/10/03 22:48:34 by julmajustus       #+#    #+#             */
/*   Updated: 2025/10/03 22:49:04 by julmajustus      ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#define _GNU_SOURCE
#include <sys/socket.h>
#include <sys/un.h>
#include <unistd.h>
#include <errno.h>
#include <limits.h>
#include <fcntl.h>
#include <stdio.h>
#include <string.h>
#include <stdbool.h>
#include <stdlib.h>
#include "ptt_bridge.h"

static int ptt_fd = -1;
static struct sockaddr_un ptt_addr;
static socklen_t ptt_addrlen;

static void ptt_init_addr(void) {
	memset(&ptt_addr, 0, sizeof(ptt_addr));
	ptt_addr.sun_family = AF_UNIX;
	const char *xdg = getenv("XDG_RUNTIME_DIR");

	if (!xdg)
		return;

	snprintf(ptt_addr.sun_path, sizeof(ptt_addr.sun_path), "%s/dwl-ptt.sock", xdg);
	ptt_addrlen = offsetof(struct sockaddr_un, sun_path) + strlen(ptt_addr.sun_path) + 1;
}

static void ptt_ensure_fd(void) {
	if (ptt_fd >= 0)
		return;

	ptt_fd = socket(AF_UNIX, SOCK_DGRAM | SOCK_CLOEXEC, 0);

	if (ptt_fd < 0)
		fprintf(stderr, "ptt socket(): %s\n", strerror(errno));

	if (ptt_addrlen == 0)
		ptt_init_addr();
}

void ptt_notify(bool pressed) {
	ptt_ensure_fd();

	if (ptt_fd < 0 || ptt_addrlen == 0)
		return;

	unsigned char b = pressed ? 'P' : 'R';
	ssize_t n = sendto(ptt_fd, &b, 1, MSG_NOSIGNAL,
					(struct sockaddr *)&ptt_addr, ptt_addrlen);
	if (n < 0) {
		int e = errno;
		close(ptt_fd);
		ptt_fd = -1;
		ptt_ensure_fd();

		if (ptt_fd >= 0) {
			sendto(ptt_fd, &b, 1, MSG_NOSIGNAL, (struct sockaddr *)&ptt_addr, ptt_addrlen);
		}

		fprintf(stderr, "ptt sendto(): %s\n", strerror(e));
	}
}
