From: daniel@iogearbox.net (Daniel Borkmann)
Date: Thu, 22 Feb 2018 15:25:04 +0100
Subject: [PATCH v2] selftests/bpf/test_maps: exit child process without
 error in ENOMEM case
In-Reply-To: <1519266842-29004-1-git-send-email-lizhijian@cn.fujitsu.com>
References: <1519266842-29004-1-git-send-email-lizhijian@cn.fujitsu.com>
Message-ID: <dd9b9ef2-ee8f-ad81-61dc-ce57117f803f@iogearbox.net>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20180222142504.rXXbUh4pVLhyjrd8h0Lt5f7c_ev6WknICJ80HiTVI4A@z>

On 02/22/2018 03:34 AM, Li Zhijian wrote:
> From: Li Zhijian <zhijianx.li at intel.com>
> 
> test_maps contains a series of stress tests, and previously it will break the
> rest tests when it failed to alloc memory.
> -----------------------
> Failed to create hashmap key=8 value=262144 'Cannot allocate memory'
> Failed to create hashmap key=16 value=262144 'Cannot allocate memory'
> Failed to create hashmap key=8 value=262144 'Cannot allocate memory'
> Failed to create hashmap key=8 value=262144 'Cannot allocate memory'
> test_maps: test_maps.c:955: run_parallel: Assertion `status == 0' failed.
> Aborted
> not ok 1..3 selftests:  test_maps [FAIL]
> -----------------------
> after this patch, the rest tests will be continue when it occurs an ENOMEM failure
> 
> CC: Alexei Starovoitov <alexei.starovoitov at gmail.com>
> CC: Philip Li <philip.li at intel.com>
> Suggested-by: Daniel Borkmann <daniel at iogearbox.net>
> Signed-off-by: Li Zhijian <zhijianx.li at intel.com>

Applied to bpf tree, thanks Li!
--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
