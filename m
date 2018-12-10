From: kirill@shutemov.name (Kirill A. Shutemov)
Date: Mon, 10 Dec 2018 16:30:18 +0300
Subject: [PATCH] selftests/vm/gup_benchmark.c: match gup struct to kernel
In-Reply-To: <20181208020645.GA28467@alison-desk.jf.intel.com>
References: <20181208020645.GA28467@alison-desk.jf.intel.com>
Message-ID: <20181210133018.hfvjodnsagkdsiwj@kshutemo-mobl1>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20181210133018.pCzXqCWz_hpWVL7q80lPGy_3-AQMSi7brRm_UqutN9U@z>

On Fri, Dec 07, 2018@06:06:45PM -0800, Alison Schofield wrote:
> An expansion field was added to the kernel copy of this structure for
> future use. See mm/gup_benchmark.c.
> 
> Add the same expansion field here, so that the IOCTL command decodes
> correctly. Otherwise, it fails with EINVAL.
> 
> Signed-off-by: Alison Schofield <alison.schofield at intel.com>

Acked-by: Kirill A. Shutemov <kirill.shutemov at linux.intel.com>

-- 
 Kirill A. Shutemov
