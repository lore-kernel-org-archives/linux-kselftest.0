From: greg@kroah.com (Greg KH)
Date: Sun, 5 May 2019 12:23:14 +0200
Subject: [net-next v2] net: sched: Introduce act_ctinfo action
In-Reply-To: <20190505101523.48425-1-ldir@darbyshire-bryant.me.uk>
References: <CAM_iQpXnXyfLZ2+gjDufbdMrZLgtf9uKbzbUf50Xm-2Go7maVw@mail.gmail.com>
 <20190505101523.48425-1-ldir@darbyshire-bryant.me.uk>
Message-ID: <20190505102314.GA12761@kroah.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190505102314.64Z1DKLwRaAcislFKE8r36OlGS6Kc4u6YuGHxuHmNmQ@z>

On Sun, May 05, 2019@10:15:43AM +0000, Kevin 'ldir' Darbyshire-Bryant wrote:
> --- /dev/null
> +++ b/net/sched/act_ctinfo.c
> @@ -0,0 +1,407 @@
> +// SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note

How can a .c file, buried in the kernel tree, have a Linux-syscall-note
exception to it?

Are you _sure_ that is ok?  That license should only be for files in the
uapi header directory.

thanks,

greg k-h
