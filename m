Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.17
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795626982;
	b=Kirq/2ReS29p9gsqHzXbWqgw2ZZ9BgueGEuqgBCea4NX0g0hEGQPEMHgZ69mJZRqYKdI
	 lh1oKZl8W8kXyqcdeNz6dOcmCbSpLRNUxDIrtC6bh+xCg4UbJ1t6QhGyAkzU5rJ37+ikq
	 KooSBVI84bdmkro7bO0dJ6E422nJUgUGNzW7LXga8s6RBaw01cPZTINJsiCOhizfrcT5E
	 ubSLiyIGZnhYqU6rUvQepO4NR5RrkQhgLNqRlgjbX7z5Q8RqVQoPUPdQ3Aq4QfDygvBA6
	 jth3WqIDqNr3hjEZjp10rsF1pAkNfvfxsAHXhSy5zj3CKAerbnVqy6hYPoyCSTPj9ww==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795626982;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=0XJ99uewa+KtsNo9XkOKtjKPjKDCzD0NbSDxZp+Yar8=;
	b=zku+FotcWAL0WVARPwyksZoMgc8GwoSC4dN38IWYLK4xFWp9lzOF+Akpm2SvSaLzRELn
	 2z7znefd7NedpHzYr3wcz5057+vnC6LxrYgF3H5QWjzbAc8ukxkBM6EXVYlJy6X/ZAufE
	 wMaB/sf+gOdoyI7n4Px4+bVjzOECXsLdbvimU5hKN56fdPQUTaCEXvk2DGJn6zDVdyGjn
	 zfmfxoS8MbcACs+YUtpOnFxvOss8MOgOVrnWa1chhcNwVjO9LO9k1w/yReQntkPJgXdAz
	 /0aPorSl3DViemxxu+3MIWFdfASmOUsMK30njaQOT0LAfIQ/KdndS3t7STBrkat1xtA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=nxNDVcFB;
	arc=none smtp.remote-ip=192.198.163.17
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC682606A331;
	Wed, 25 Nov 2026 17:16:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CC682606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=nxNDVcFB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795626982; x=1827162982;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=WcuGcUE+EwZ5wRASadJcsmh+YFYYe0xIYYtZnCYENIY=;
  b=nxNDVcFBI0Nvo64YuGRcS7VtYKVFHTsSDpRIrn+WEsCfNferl98GqX7N
   iwQRPEXXZVxCWF60oBCS3ounNsYqe9msh8gG17ZMg+sdYlYOkujnDElzh
   D8m72XmRs/XHbvY9qGS5H4Kn8AN+V8g5lEXIrK1lbL0U57BqSg+VXGekT
   I7ewDWEHtxNj4qOxrCbqNRkgYkb7WHqtY5ogDRkOIOa6uGy+eeaGYkB6Y
   wBqC9/5DvhSuLkX7wh61jqwe05mRTiU/6xBmWGJOjsyVT1Pz21TxDNpxL
   0osJKFq8pLvc6B+TEgCtJqUb5e4F3eV2Q5twd6U8ouESzujN9shUm9+C9
   g==;
X-CSE-ConnectionGUID: yxxcYkikSnaIQFt9/qwm/w==
X-CSE-MsgGUID: /FIixgudRTiPeQE1lEhU5A==
X-IronPort-AV: E=McAfee;i="6800,10657,11977"; a="4504445"
X-IronPort-AV: E=Sophos;i="6.27,233,1787036400"; 
   d="scan'208";a="4504445"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2026 08:45:12 -0800
X-CSE-ConnectionGUID: N09VVOjbRLiZ5trnYphJjA==
X-CSE-MsgGUID: KqMnJCIJQsSP7hGHZ+fvdA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,233,1787036400"; 
   d="scan'208";a="11802730"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 25 Nov 2026 08:45:06 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xWG7C-00000001S7G-0Bev;
	Wed, 25 Nov 2026 16:45:02 +0000
Date: Thu, 26 Nov 2026 00:44:36 +0800
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
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
	Shivank Garg <shivankg@amd.com>
Subject: Re: [PATCH 1/3] mm: move the soft-dirty fallbacks up in pgtable.h
Message-ID: <20261126003542.QALFbvl0-lkp@intel.com>
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
config: arm-allnoconfig (https://download.01.org/0day-ci/archive/20261126/20261126003542.QALFbvl0-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261126/20261126003542.QALFbvl0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/20261126003542.QALFbvl0-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/arm/kernel/asm-offsets.c:14:
>> include/linux/mm.h:972:19: error: call to undeclared function 'pgtable_supports_soft_dirty'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     972 |         VM_WARN_ON_ONCE(!pgtable_supports_soft_dirty() && (flags & VM_SOFTDIRTY));
         |                          ^
   include/linux/mm.h:985:19: error: call to undeclared function 'pgtable_supports_soft_dirty'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     985 |         VM_WARN_ON_ONCE(!pgtable_supports_soft_dirty() && (flags & VM_SOFTDIRTY));
         |                          ^
   include/linux/mm.h:1000:19: error: call to undeclared function 'pgtable_supports_soft_dirty'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1000 |         VM_WARN_ON_ONCE(!pgtable_supports_soft_dirty() && (flags & VM_SOFTDIRTY));
         |                          ^
   3 errors generated.
   make[3]: *** [scripts/Makefile.build:185: arch/arm/kernel/asm-offsets.s] Error 1
   make[3]: Target 'prepare' not remade because of errors.
   make[2]: *** [Makefile:1417: prepare0] Error 2
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:248: __sub-make] Error 2
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:248: __sub-make] Error 2
   make: Target 'prepare' not remade because of errors.


vim +/pgtable_supports_soft_dirty +972 include/linux/mm.h

027232da7c7c1c Kiryl Shutsemau    2018-07-26  967  
bc292ab00f6c7a Suren Baghdasaryan 2023-01-26  968  /* Use when VMA is not part of the VMA tree and needs no locking */
bc292ab00f6c7a Suren Baghdasaryan 2023-01-26  969  static inline void vm_flags_init(struct vm_area_struct *vma,
bc292ab00f6c7a Suren Baghdasaryan 2023-01-26  970  				 vm_flags_t flags)
bc292ab00f6c7a Suren Baghdasaryan 2023-01-26  971  {
277a1ae3879a82 Chunyan Zhang      2025-11-13 @972  	VM_WARN_ON_ONCE(!pgtable_supports_soft_dirty() && (flags & VM_SOFTDIRTY));
9ea35a25d51b13 Lorenzo Stoakes    2025-11-25  973  	vma_flags_clear_all(&vma->flags);
9ea35a25d51b13 Lorenzo Stoakes    2025-11-25  974  	vma_flags_overwrite_word(&vma->flags, flags);
bc292ab00f6c7a Suren Baghdasaryan 2023-01-26  975  }
bc292ab00f6c7a Suren Baghdasaryan 2023-01-26  976  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
