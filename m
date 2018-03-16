From: gregkh at linuxfoundation.org (Greg KH)
Date: Fri, 16 Mar 2018 08:56:42 +0100
Subject: [PATCH v2] Add udmabuf misc device
In-Reply-To: <20180316074650.5415-1-kraxel@redhat.com>
References: <20180316074650.5415-1-kraxel@redhat.com>
Message-ID: <20180316075642.GB11982@kroah.com>

On Fri, Mar 16, 2018 at 08:46:49AM +0100, Gerd Hoffmann wrote:
> --- /dev/null
> +++ b/tools/testing/selftests/drivers/dma-buf/udmabuf.c
> @@ -0,0 +1,69 @@
> +#include <stdio.h>
> +#include <stdlib.h>
> +#include <unistd.h>
> +#include <string.h>
> +#include <errno.h>
> +#include <fcntl.h>
> +#include <malloc.h>

No license text at all?  Come on, I already made one commit in the tree
that touched 11k files, I don't want to have to do it again :)

thanks,

greg k-h
--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
