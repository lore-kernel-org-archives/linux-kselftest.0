From: gregkh at linuxfoundation.org (Greg KH)
Date: Sat, 21 Apr 2018 11:04:49 +0200
Subject: [PATCH v4 1/2] char: sparc64: Add privileged ADI driver
In-Reply-To: <20180420205221.488589-2-tom.hromatka@oracle.com>
References: <20180420205221.488589-1-tom.hromatka@oracle.com>
 <20180420205221.488589-2-tom.hromatka@oracle.com>
Message-ID: <20180421090449.GA8194@kroah.com>

On Fri, Apr 20, 2018 at 02:52:20PM -0600, Tom Hromatka wrote:
> --- /dev/null
> +++ b/drivers/char/adi.c
> @@ -0,0 +1,240 @@
> +// SPDX-License-Identifier: GPL-2.0

Good, but:

> +MODULE_LICENSE("GPL");

That's the wrong line :(

Read include/linux/module.h for the correct string to put here for a
GPL version 2 only module.

thanks,

greg k-h
--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
