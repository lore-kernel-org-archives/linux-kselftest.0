Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.17
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795626981;
	b=FFgB4ZpM6FeUxZiUiY4SaSaYnFtCbVzUSq6pb8ohGatA/5k8aAxYwM1+XqU8rUVdFACZ
	 glomo7qJwhqYC7GoEFeeOiO12eQdclKfLmU5XaBBHLrH9DIJACfEY0MFP41F6LUBlDrMC
	 CWUCJ9nGEh9Amr0ziGo9+nXP8z2yzpPpQmaEp+NYO9x3JugpotL0k+kz6J7gMpFioOuAe
	 mlxPJi5A+IE5Um9gZdOAshHNDRVa5FKHQASyjQBm3dHZtog+YWGI3GmVYjFlTjkP96XLS
	 LVWbCZdstway9i/ttCbJtYVfw0gfc2g1xBx/0+BkJbMTiVwPblj7PjQFbjaMoPIGwPg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795626981;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=nv3AVi2ii8sDqpBUYLroZbzyYAj1uyi+9hphR1p4z60=;
	b=tbgCDRGM+cGW4mKyUCB7Az2NbhiCs4bzpmwP06q5i9zgxM8c+ChqZrGzb5RQaovkQFdA
	 h701EzdWInu7QjuTKE7cWG5fwiFhgAyT0dkyjnAVDmH318rIfMqCqlmx9yo6mC0VA/Kg8
	 b8QPsXQBvxm2qHQGgVGwJ2kjIDFlvAA1DpZX0sfFf7EUVklYjSDdWLjCMbMcsSPGdFcTJ
	 LrKHVifAggftRkPQhjnhqlXQjDGbHamuTcq9ODTSwIEsJVfsTxWKxHGt/EnAL7pkk/b+7
	 d+fUokUjPKj//SXDSB4NpPghXsoqwMWbuKgIAxZ5r0IKTGKSSXSyG/yipEyxAWxVPAQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ftGbV5uh;
	arc=none smtp.remote-ip=192.198.163.17
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20059606A321;
	Wed, 25 Nov 2026 17:16:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 20059606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ftGbV5uh
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795626980; x=1827162980;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=+k9uvO9rNhYlF7PPTcvzGNkwTo+8Re6JcWEKubDKrlc=;
  b=ftGbV5uhoZ9KdOes4qeVqdL4Uriz4Gf9WyuuNSLP8tZxv+PEVEaFEWxu
   ast90N4nKfkpuaxO7op3AFnoWsejcSfxi9AhRYwxGVyv+uh8btDxcjTne
   SPfLF4l1L7WX1wxRLB01CvjKiwLqZPenqXBJPaQlQXmCXi7+f8YNuInHE
   fo7Cib9ObHREDFNfeFlRsV4HvlJQKuWOSJr6YIWeDf7pd1wWjoOMhiCzI
   UrSnXmtr8/AP/o30tnI5xXf6B0KuzQm3tH0gxewzBqRyW7ASThJOEOCpT
   PUjALXX2LJcoOeYnw/EGoH1URqZxmucrEcY6VjEKhM2n/m2iB87rF9Ba6
   g==;
X-CSE-ConnectionGUID: o58v14YFRsqrSa3qI6ltHw==
X-CSE-MsgGUID: TXykYFidTLKhvcEffXsuxQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11977"; a="4504426"
X-IronPort-AV: E=Sophos;i="6.27,233,1787036400"; 
   d="scan'208";a="4504426"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2026 08:45:12 -0800
X-CSE-ConnectionGUID: UMC9+qpYRaONe4cUeA5ZZg==
X-CSE-MsgGUID: PgM3kGfERdagckdYk/vZsw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,233,1787036400"; 
   d="scan'208";a="11802729"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 25 Nov 2026 08:45:06 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xWG7C-00000001S7E-06jJ;
	Wed, 25 Nov 2026 16:45:02 +0000
Date: Thu, 26 Nov 2026 00:44:35 +0800
From: kernel test robot <lkp@intel.com>
To: Shivank Garg <shivankg@amd.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	"Liam R. Howlett" <liam@infradead.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>, Dev Jain <dev.jain@arm.com>,
	Zi Yan <ziy@nvidia.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Nico Pache <nico.pache@linux.dev>,
	Ryan Roberts <ryan.roberts@arm.com>, Barry Song <baohua@kernel.org>,
	Lance Yang <lance.yang@linux.dev>,
	Usama Arif <usama.arif@linux.dev>, Kiryl Shutsemau <kas@kernel.org>,
	Peter Xu <peterx@redhat.com>,
	Shuah Khan <skhan@linuxfoundation.org>,
	=?utf-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <emmir@google.com>,
	Andrei Vagin <avagin@gmail.com>,
	Paul Gofman <pgofman@codeweavers.com>,
	Bharata B Rao <bharata@amd.com>, Daniel Wade <danjwade95@gmail.com>,
	Yin Tirui <yintirui@gmail.com>,
	Muhammad Usama Anjum <usama.anjum@arm.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
	Shivank Garg <shivankg@amd.com>
Subject: Re: [PATCH 1/3] mm: move the soft-dirty fallbacks up in pgtable.h
Message-ID: <20261126003419.x9qXgaij-lkp@intel.com>
References: <20261125-b4-mm-soft-dirty-fixes-v1-1-538e3cdb618c@amd.com>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261125-b4-mm-soft-dirty-fixes-v1-1-538e3cdb618c@amd.com>

Hi Shivank,

kernel test robot noticed the following build errors:

[auto build test ERROR on 98f6b507621822477db7ec7cef8519de0dd243c4]

url:    https://github.com/intel-lab-lkp/linux/commits/Shivank-Garg/mm-move-the-soft-dirty-fallbacks-up-in-pgtable-h/20261125-133227
base:   98f6b507621822477db7ec7cef8519de0dd243c4
patch link:    https://lore.kernel.org/r/20261125-b4-mm-soft-dirty-fixes-v1-1-538e3cdb618c%40amd.com
patch subject: [PATCH 1/3] mm: move the soft-dirty fallbacks up in pgtable.h
config: m68k-allnoconfig (https://download.01.org/0day-ci/archive/20261126/20261126003419.x9qXgaij-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 16.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261126/20261126003419.x9qXgaij-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/20261126003419.x9qXgaij-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/init.h:5,
                    from include/linux/printk.h:6,
                    from include/asm-generic/bug.h:31,
                    from arch/m68k/include/asm/bug.h:32,
                    from include/linux/bug.h:5,
                    from include/linux/thread_info.h:13,
                    from include/asm-generic/preempt.h:5,
                    from ./arch/m68k/include/generated/asm/preempt.h:1,
                    from include/linux/preempt.h:107,
                    from arch/m68k/include/asm/irqflags.h:6,
                    from include/linux/irqflags.h:18,
                    from arch/m68k/include/asm/atomic.h:6,
                    from include/linux/atomic.h:7,
                    from include/linux/jump_label.h:243,
                    from include/linux/once.h:6,
                    from include/linux/prandom.h:12,
                    from kernel/sched/sched.h:8,
                    from kernel/sched/rq-offsets.c:5:
   include/linux/mm.h: In function 'vm_flags_init':
>> include/linux/mm.h:972:26: error: implicit declaration of function 'pgtable_supports_soft_dirty' [-Wimplicit-function-declaration]
     972 |         VM_WARN_ON_ONCE(!pgtable_supports_soft_dirty() && (flags & VM_SOFTDIRTY));
         |                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:30:63: note: in definition of macro 'BUILD_BUG_ON_INVALID'
      30 | #define BUILD_BUG_ON_INVALID(e) ((void)(sizeof((__force long)(e))))
         |                                                               ^
   include/linux/mm.h:972:9: note: in expansion of macro 'VM_WARN_ON_ONCE'
     972 |         VM_WARN_ON_ONCE(!pgtable_supports_soft_dirty() && (flags & VM_SOFTDIRTY));
         |         ^~~~~~~~~~~~~~~
   make[3]: *** [scripts/Makefile.build:185: kernel/sched/rq-offsets.s] Error 1
   make[3]: Target 'prepare' not remade because of errors.
   make[2]: *** [Makefile:1417: prepare0] Error 2
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:248: __sub-make] Error 2
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:248: __sub-make] Error 2
   make: Target 'prepare' not remade because of errors.


vim +/pgtable_supports_soft_dirty +972 include/linux/mm.h

027232da7c7c1c7 Kiryl Shutsemau    2018-07-26  967  
bc292ab00f6c7a6 Suren Baghdasaryan 2023-01-26  968  /* Use when VMA is not part of the VMA tree and needs no locking */
bc292ab00f6c7a6 Suren Baghdasaryan 2023-01-26  969  static inline void vm_flags_init(struct vm_area_struct *vma,
bc292ab00f6c7a6 Suren Baghdasaryan 2023-01-26  970  				 vm_flags_t flags)
bc292ab00f6c7a6 Suren Baghdasaryan 2023-01-26  971  {
277a1ae3879a82a Chunyan Zhang      2025-11-13 @972  	VM_WARN_ON_ONCE(!pgtable_supports_soft_dirty() && (flags & VM_SOFTDIRTY));
9ea35a25d51b130 Lorenzo Stoakes    2025-11-25  973  	vma_flags_clear_all(&vma->flags);
9ea35a25d51b130 Lorenzo Stoakes    2025-11-25  974  	vma_flags_overwrite_word(&vma->flags, flags);
bc292ab00f6c7a6 Suren Baghdasaryan 2023-01-26  975  }
bc292ab00f6c7a6 Suren Baghdasaryan 2023-01-26  976  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
