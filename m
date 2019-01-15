From: alison.schofield@intel.com (Alison Schofield)
Date: Tue, 15 Jan 2019 09:45:22 -0800
Subject: [PATCH] selftests/vm/gup_benchmark.c: match gup struct to kernel
In-Reply-To: <20181208020645.GA28467@alison-desk.jf.intel.com>
References: <20181208020645.GA28467@alison-desk.jf.intel.com>
Message-ID: <20190115174521.GA3602@alison-desk.jf.intel.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190115174522.AFiHdVzp_NjrTT5pNhinAoZWwHpKJP2n4ke4pDKgsUY@z>

Hi Shauh,

Ping on this one. It has Kirill's ACK. Without this fix the
gup_benchmark fails to run (at all).

Thanks!
Alison

On Fri, Dec 07, 2018@06:06:45PM -0800, Alison Schofield wrote:
> An expansion field was added to the kernel copy of this structure for
> future use. See mm/gup_benchmark.c.
> 
> Add the same expansion field here, so that the IOCTL command decodes
> correctly. Otherwise, it fails with EINVAL.
> 
> Signed-off-by: Alison Schofield <alison.schofield at intel.com>
Acked-by: Kirill A. Shutemov <kirill.shutemov at linux.intel.com>

> ---
>  tools/testing/selftests/vm/gup_benchmark.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/tools/testing/selftests/vm/gup_benchmark.c b/tools/testing/selftests/vm/gup_benchmark.c
> index 880b96fc80d4..c0534e298b51 100644
> --- a/tools/testing/selftests/vm/gup_benchmark.c
> +++ b/tools/testing/selftests/vm/gup_benchmark.c
> @@ -25,6 +25,7 @@ struct gup_benchmark {
>  	__u64 size;
>  	__u32 nr_pages_per_call;
>  	__u32 flags;
> +	__u64 expansion[10];	/* For future use */
>  };
>  
>  int main(int argc, char **argv)
> -- 
> 2.14.1
> 
