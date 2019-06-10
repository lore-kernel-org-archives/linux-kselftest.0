From: huw@codeweavers.com (Huw Davies)
Date: Mon, 10 Jun 2019 10:27:52 +0100
Subject: [PATCH v6 01/19] kernel: Standardize vdso_datapage
In-Reply-To: <20190530141531.43462-2-vincenzo.frascino@arm.com>
References: <20190530141531.43462-1-vincenzo.frascino@arm.com>
 <20190530141531.43462-2-vincenzo.frascino@arm.com>
Message-ID: <20190610092751.GA11076@merlot.physics.ox.ac.uk>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190610092752.1bq9lX14S7tMM2iTs9EKwsuVLndX1tvtBJ7UgBtkK1I@z>

On Thu, May 30, 2019@03:15:13PM +0100, Vincenzo Frascino wrote:
> --- /dev/null
> +++ b/include/vdso/datapage.h
> @@ -0,0 +1,91 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +#ifndef __VDSO_DATAPAGE_H
> +#define __VDSO_DATAPAGE_H
> +
> +#ifdef __KERNEL__
> +
> +#ifndef __ASSEMBLY__
> +
> +#include <linux/bits.h>
> +#include <linux/time.h>
> +#include <linux/types.h>
> +
> +#define VDSO_BASES	(CLOCK_TAI + 1)
> +#define VDSO_HRES	(BIT(CLOCK_REALTIME)		| \
> +			 BIT(CLOCK_MONOTONIC)		| \
> +			 BIT(CLOCK_BOOTTIME)		| \
> +			 BIT(CLOCK_TAI))
> +#define VDSO_COARSE	(BIT(CLOCK_REALTIME_COARSE)	| \
> +			 BIT(CLOCK_MONOTONIC_COARSE))
> +#define VDSO_RAW	(BIT(CLOCK_MONOTONIC_RAW))
> +
> +#define CS_HRES_COARSE	0
> +#define CS_RAW		1

CS_HRES_COARSE seems like a confusing name choice to me.  What you
really mean is not RAW.

How about CS_ADJ to indicate that its updated by adjtime?
CS_XTIME might be another option.

Huw.
