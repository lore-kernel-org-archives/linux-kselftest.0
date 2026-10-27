Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.16
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793079569;
	b=xH5qj5JHlN/Vkv9WZSY9atbzfKl0bYcCHbQf+cY9vfzirxkd1mJZApX2B0GyX1PfKr73
	 jeFxNCJ53yTRZvv4h9tw6dhQc5BDU5SumJbeOrUxQYsLrQzuru0O8A+k7T3T5tRUsU2NQ
	 cT83QqZbXwx3v8hN964GxrWISpSSVRaO7PqndpfIlmBGlqHfsFWaCVJK6dbWbN3V7QwEl
	 V2kyr41P0UdKUAYnD3HNrUvVA+dKkQEd2jCv2668a1Nl/RToIAMU19w+o/yRIJNpIWUyE
	 Md3oCCHF83PP7cd8OXuNTY5862GCabe4LB/tK3B/s8hpbgdaF6EzFCasmACbtk/qVzw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793079569;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=QMFHkYsqBmcbVrWKDFByhexqX1LEHDSolSs6zJfCkfQ=;
	b=xI6PLd6dcdLA4Im3/1yJRWMRiqFvop5EVR3lSrdJStO4QMi7r18n7uMN9vMNaLgLsa/U
	 ZKgUaYls4SkahcANVl5Ba8MFelBPQruYqKSGFcbyIL82rRitrN1P5DZm+n67oh2Z9bopC
	 ZXu1Q3ufWEgTBjQcgFOqIj+QMflISTpcOJInsvaIJEv1XSHGXUly02VCf7T79ePw/ImGZ
	 vHmnZFO6r2maZ94NvvA9KrWyWRyeckDvGTrndV5zg9sFwbprgYVv1DSHqB8oLbWpLwA0O
	 Rbhy1KkxuncUt7Kt1B1VrqfV/SLwZPnnRuJqbu9xe0iLNe/yh/d0oVZg/QjxJl+CtLQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=j7uXFMbK;
	arc=none smtp.remote-ip=192.198.163.16
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D13AE606A31A;
	Tue, 27 Oct 2026 05:39:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D13AE606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=j7uXFMbK
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793079568; x=1824615568;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=pzpMExCU3NEyvekb7kKHOljun21uUmMNQ6c0Pg++oXE=;
  b=j7uXFMbKpf89IH0ErCdVPNLnszj6wE1ogB6m1DBZBFHgmWbgXi8I8esO
   s8zwlVTWS5xyfpC05M3INW2qvqyLzm9YnoUBh3u2pxfPZr0hpHycZP2B2
   socFwvoGh5455XK97pDI/tTHS9HHdFMZk2bVAR5lIgi5ok7tyw62pRD8v
   T6thqoxf4nb5DF3c4Xu4/ADY8Y6vjnV18dWjeauKcSF9n+UJl1+cSoLNs
   ylarYzmLfn/x1/RCkafhpDeashwNZhg0J/uCpd+gTUXgRg+WY0Pz1lLIZ
   ZfgdQiNcOAoxl/5kNgZwOfr3m6wRkPcqneiNv0UOfLE0VDuDScUu+cwXB
   Q==;
X-CSE-ConnectionGUID: Su7U9/QdRZug/1XWKaTXFQ==
X-CSE-MsgGUID: sm4dxMPfS1OYj50qrJ6arg==
X-IronPort-AV: E=McAfee;i="6800,10657,11947"; a="1781494"
X-IronPort-AV: E=Sophos;i="6.27,180,1787036400"; 
   d="scan'208";a="1781494"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Oct 2026 22:39:27 -0700
X-CSE-ConnectionGUID: 1kxPM+3HSqW+g3X4zqBZMQ==
X-CSE-MsgGUID: jyfpNWjzS7ynp1/Q36Pggw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,180,1787036400"; 
   d="scan'208";a="4843020"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 26 Oct 2026 22:39:22 -0700
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xLZu2-00000000WtE-2eZ1;
	Tue, 27 Oct 2026 05:39:18 +0000
Date: Tue, 27 Oct 2026 13:38:19 +0800
From: kernel test robot <lkp@intel.com>
To: David Matlack <dmatlack@google.com>, kexec@lists.infradead.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org, linux-mm@kvack.org
Cc: oe-kbuild-all@lists.linux.dev, Alexander Graf <graf@amazon.com>,
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
Message-ID: <202610271346.EnKIU96f-lkp@intel.com>
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
config: m68k-allnoconfig (https://download.01.org/0day-ci/archive/20261027/202610271346.EnKIU96f-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 16.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261027/202610271346.EnKIU96f-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610271346.EnKIU96f-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> mm/shmem.c:5867:6: warning: no previous prototype for 'shmem_inode_on_internal_mount' [-Wmissing-prototypes]
    5867 | bool shmem_inode_on_internal_mount(const struct inode *inode)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~


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
