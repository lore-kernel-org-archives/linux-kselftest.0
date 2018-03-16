From: dave.hansen@intel.com (Dave Hansen)
Date: Fri, 16 Mar 2018 15:33:56 -0700
Subject: [PATCH v12 21/22] selftests/vm: sub-page allocator
In-Reply-To: <1519264541-7621-22-git-send-email-linuxram@us.ibm.com>
References: <1519264541-7621-1-git-send-email-linuxram@us.ibm.com>
 <1519264541-7621-22-git-send-email-linuxram@us.ibm.com>
Message-ID: <f2c8f721-b107-3bdc-3c09-01b9849c4ce2@intel.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20180316223356.1sPnyCdnJXznqSOjzQh2dKOQhWyqBBAPcOQ88MCQh8g@z>

On 02/21/2018 05:55 PM, Ram Pai wrote:
...
> @@ -888,6 +917,7 @@ void setup_hugetlbfs(void)
>  void *(*pkey_malloc[])(long size, int prot, u16 pkey) = {
>  
>  	malloc_pkey_with_mprotect,
> +	malloc_pkey_with_mprotect_subpage,
>  	malloc_pkey_anon_huge,
>  	malloc_pkey_hugetlb
>  /* can not do direct with the pkey_mprotect() API:


I think I'd rather have an #ifdef on the array entries than have the
malloc entry do nothing on x86.  Maybe have a ppc-specific section at
the end?
--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
