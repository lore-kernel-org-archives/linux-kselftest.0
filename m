From: alexei.starovoitov@gmail.com (Alexei Starovoitov)
Date: Tue, 13 Feb 2018 19:28:22 -0800
Subject: [PATCH] selftests/bpf/test_maps: exit child process without
 error in ENOMEM case
In-Reply-To: <1518443524-18373-1-git-send-email-lizhijian@cn.fujitsu.com>
References: <1518443524-18373-1-git-send-email-lizhijian@cn.fujitsu.com>
Message-ID: <20180214032820.jjedkz2z4bii4asz@ast-mbp.dhcp.thefacebook.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20180214032822.xUiFXJjM-escTWNrttyikbslE91QQ0CRJqvtPvk0Eu0@z>

On Mon, Feb 12, 2018@09:52:04PM +0800, Li Zhijian wrote:
> From: Li Zhijian <zhijianx.li at intel.com>
> 
> test_maps contains a series of stress tests, and previously it will break the
> reset tests when it failed to alloc memory.
> -----------------------
> Failed to create hashmap key=8 value=262144 'Cannot allocate memory'
> Failed to create hashmap key=16 value=262144 'Cannot allocate memory'
> Failed to create hashmap key=8 value=262144 'Cannot allocate memory'
> Failed to create hashmap key=8 value=262144 'Cannot allocate memory'
> test_maps: test_maps.c:955: run_parallel: Assertion `status == 0' failed.
> Aborted
> not ok 1..3 selftests:  test_maps [FAIL]
> -----------------------
> after this patch, the rest tests will be continue when it occurs a ENOMEM failure
> 
> CC: Alexei Starovoitov <alexei.starovoitov at gmail.com>
> CC: Philip Li <philip.li at intel.com>
> Suggest-by: Daniel Borkmann <daniel at iogearbox.net>
> Signed-off-by: Li Zhijian <zhijianx.li at intel.com>

could you please resend it and cc netdev so it appears in patchworks properly.

Thanks!

--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
