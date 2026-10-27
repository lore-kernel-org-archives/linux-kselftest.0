Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793077468;
	b=rjB2KFrFkesUtxeNu5gYb381baW+7qibrcPfMJpozl4+56y1urqZW9vtxAyGFHeKYTCb
	 9TB4a6I/8HD70CC8y6DuipXlCLPkXCb7Cq/uxudWkKFabCaF853JwpchqbYeDzQzwyJV3
	 I1sBMeOH5LJsmxkGBjxByrv2K8EM/6v62XJeZBpN5SfMT/BtGKqcKa4a4CBxUyEbuG/0L
	 eMU4L5zIGnIJYrLVJv58S3X+ICWqmQe5dbXGHbCKyAPfdGcEnJW31BoMFMllm4rc9BHZI
	 pOeG/p4SCkdC2bjt74QdOyiK5rVq7jZmguoqmWcs+AA6Hl32r0FTjQt4RurTJGofB4w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793077468;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=Ai6yw3OuibhURm/WO66vXn3DXBjDe0k2rnzBv97yR0A=;
	b=zJmobprvcmwl7OTR6piiF/bSXIhL8WX3hxWCFRm47ot7AbClZZD9r9965/LkKdQQEUcY
	 Q369upMa9YE+XN+xi57njS/S8g5MqdE5Oy0yItalEHnBBmpPXMkRROmstJ2F8HX9oBadU
	 YKjTNpOnlFb9F5VJFllRIyd5D1iMnP9sBhhdzVQFRV7Z/pmLt4Vxtze8kqdFswQKZl3si
	 7yffA39EKLb7Fl4AhCEE5gdL8wHtM6wCEyzjCmGS4tF+SB8z1lqEMa3AA7IFmKnR1uX6h
	 DbHNsaRXpwIIGp3Cv2f01B73w7UI67sweVXmJyGBA92Ke43ce7bR7hLMrqmeylPvQWA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=UhGqxwCm;
	arc=none smtp.remote-ip=192.198.163.18
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45171606A31A;
	Tue, 27 Oct 2026 05:04:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 45171606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=UhGqxwCm
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793077467; x=1824613467;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=HAhrArfOGx4d2m+iNXRk5VLLSvyuYaHbyyD0xEP12kY=;
  b=UhGqxwCmc3z1LpSG4EUSUyCFCEx9cbQwPK5uuGJGiEfQeXIHqQO8pt14
   5A71N9XiErTpRAtNv+xgexTQStlc9JGaVMItg7mFZydcfysf/T22kheFR
   6AzRmn0bvpt3vAC2SYGiL1FgL3hOd4lsIOyCstEFjfeTuLNbNG/P3UWuF
   9EuETMtlmhHk03qCY9cH+4tUNuSEtvcqAVps1CUTpqVJzcliFz6QI/TGM
   p6gTG9HSX0o6v+hrd+PhNoFtL5XrwXNCRBip3dFUtahraCP4HKxM55jI2
   Uze4rJi8dyONO24zvrm1yIbI3MtkZBqe8m7iEZfOcVTJPjoRQHImzQN4t
   g==;
X-CSE-ConnectionGUID: /7q4neWXQeeNCJMiiB0zyg==
X-CSE-MsgGUID: B+Eve/hlRYiU78Nx97/nvg==
X-IronPort-AV: E=McAfee;i="6800,10657,11947"; a="1800146"
X-IronPort-AV: E=Sophos;i="6.27,180,1787036400"; 
   d="scan'208";a="1800146"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Oct 2026 22:04:26 -0700
X-CSE-ConnectionGUID: GCpDDQhAQtuGSgdOwwRe2g==
X-CSE-MsgGUID: mzaicXv/SACWC/OGO9hrOA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,180,1787036400"; 
   d="scan'208";a="4843596"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 26 Oct 2026 22:04:20 -0700
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xLZM8-00000000WrA-3Kg9;
	Tue, 27 Oct 2026 05:04:16 +0000
Date: Tue, 27 Oct 2026 13:04:14 +0800
From: kernel test robot <lkp@intel.com>
To: David Matlack <dmatlack@google.com>, kexec@lists.infradead.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org, linux-mm@kvack.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Alexander Graf <graf@amazon.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Christian Brauner <brauner@kernel.org>,
	David Hildenbrand <david@kernel.org>,
	Hugh Dickins <hughd@google.com>, Jonathan Corbet <corbet@lwn.net>,
	"Liam R. Howlett" <liam@infradead.org>,
	Lorenzo Stoakes <ljs@kernel.org>, Michal Hocko <mhocko@suse.com>,
	Mike Rapoport <rppt@kernel.org>,
	Pasha Tatashin <pasha.tatashin@soleen.com>,
	Pratyush Yadav <pratyush@kernel.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Samiullah Khawaja <skhawaja@google.com>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Vlastimil Babka <vbabka@kernel.org>,
	David Matlack <dmatlack@google.com>
Subject: Re: [PATCH v2 07/10] mm/shmem_luo: Retrieve tmpfs files onto a tmpfs
 mount chosen by userspace
Message-ID: <202610271253.yDB2IOkw-lkp@intel.com>
References: <20261022225035.377445-8-dmatlack@google.com>
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
In-Reply-To: <20261022225035.377445-8-dmatlack@google.com>

Hi David,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 80cf37169daef112b6bea9ae7d9808355a045475]

url:    https://github.com/intel-lab-lkp/linux/commits/David-Matlack/liveupdate-Pass-user-argument-to-file-preserve-and-retrieve/20261022-225026
base:   80cf37169daef112b6bea9ae7d9808355a045475
patch link:    https://lore.kernel.org/r/20261022225035.377445-8-dmatlack%40google.com
patch subject: [PATCH v2 07/10] mm/shmem_luo: Retrieve tmpfs files onto a tmpfs mount chosen by userspace
config: arm-allnoconfig (https://download.01.org/0day-ci/archive/20261027/202610271253.yDB2IOkw-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261027/202610271253.yDB2IOkw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610271253.yDB2IOkw-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> mm/shmem.c:5867:6: warning: no previous prototype for function 'shmem_inode_on_internal_mount' [-Wmissing-prototypes]
    5867 | bool shmem_inode_on_internal_mount(const struct inode *inode)
         |      ^
   mm/shmem.c:5867:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    5867 | bool shmem_inode_on_internal_mount(const struct inode *inode)
         | ^
         | static 
   1 warning generated.


vim +/shmem_inode_on_internal_mount +5867 mm/shmem.c

  5862	
  5863	/*
  5864	 * Whether @inode is on the internal shmem mount, which is used by
  5865	 * shmem_file_setup() and thus by memfd_create().
  5866	 */
> 5867	bool shmem_inode_on_internal_mount(const struct inode *inode)
  5868	{
  5869		return inode->i_sb == shm_mnt->mnt_sb;
  5870	}
  5871	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
