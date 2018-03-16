From: gregkh at linuxfoundation.org (Greg KH)
Date: Fri, 16 Mar 2018 08:55:53 +0100
Subject: [PATCH v2] Add udmabuf misc device
In-Reply-To: <20180316074650.5415-1-kraxel@redhat.com>
References: <20180316074650.5415-1-kraxel@redhat.com>
Message-ID: <20180316075553.GA11982@kroah.com>

On Fri, Mar 16, 2018 at 08:46:49AM +0100, Gerd Hoffmann wrote:
> --- /dev/null
> +++ b/drivers/dma-buf/udmabuf.c
> @@ -0,0 +1,261 @@
> +/*
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License version 2 as
> + * published by the Free Software Foundation.
> + */

No SPDX line or copyright here?  You put it in the .h file :(

thanks,

greg k-h
--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
