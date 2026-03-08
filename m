Received: from out-170.mta1.migadu.com (out-170.mta1.migadu.com [95.215.58.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D165A187346
	for <linux-kselftest@vger.kernel.org>; Sun,  8 Mar 2026 07:39:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772955544; cv=none; b=jjIixwhxCF2Aq/VDSV+BPsBpUNSpGfYX+aSwWkeM4RcEyJmusgSzlit0dZHQqISKnyn1T1tNLlCNgW+NdtvpBs7xZH+oZ0Ymo+25KaDICU264IW5GdCli9rKslo7zn7UcElOawT9c4GkjZVikUvQJZQqiAP/cAHQcOe803q4AgA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772955544; c=relaxed/simple;
	bh=brzk/7kHtLEwzasG2nuLUjY737UAzMYaN01SbYXMOnw=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=Y79MOqROtn2rRK9KZ5UxznsB7NdCVoKhtOQ+cQtmOz8ynnk4oPugGjmaunlZ/HPrOT2CWipPPl0s5wond0CYXAHKC5uHhTSGs3Vo07H+ZgOPbdLFDQTdukf0bMyMNf1ucCUjVyZJvrihAbPi8EQnWpY7Wbi0YuQvy1IMeOTSq5I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=ONgoRx9t; arc=none smtp.client-ip=95.215.58.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="ONgoRx9t"
Message-ID: <0b29736c-f1ee-4d03-946e-378b8fd31435@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1772955540;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MFsNHEzjn6jDUjiqgIyzr/XizL8xAfoPUxGroDwFjz0=;
	b=ONgoRx9tipBkJO4i+KkW2SJ1xNejhcRkq1IREECaKJl0NRdA+u8QipRbDhsJh328ClVy8u
	H/rklPFtdOgDQBUtCDv38Tpz73sTAED/5YwDC1cjvOAbgkG3topF2dDp5ehVEkqyf50I7j
	RbhiDVCALQCptcWbfnR61djmfhq/yso=
Date: Sat, 7 Mar 2026 23:38:49 -0800
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH 3/4] RDMA/rxe: Support RDMA link creation and destruction
 per net namespace
To: kernel test robot <lkp@intel.com>, jgg@ziepe.ca, leon@kernel.org,
 zyjzyj2000@gmail.com, dsahern@kernel.org, linux-rdma@vger.kernel.org,
 linux-kselftest@vger.kernel.org
References: <20260307075611.3410-4-yanjun.zhu@linux.dev>
 <202603081310.Lo0y72dG-lkp@intel.com>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Zhu Yanjun <yanjun.zhu@linux.dev>
In-Reply-To: <202603081310.Lo0y72dG-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT


在 2026/3/7 22:09, kernel test robot 写道:
> Hi Zhu,
>
> kernel test robot noticed the following build warnings:
>
> [auto build test WARNING on shuah-kselftest/next]
> [also build test WARNING on shuah-kselftest/fixes linus/master v7.0-rc2 next-20260306]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
>
> url:    https://github.com/intel-lab-lkp/linux/commits/Zhu-Yanjun/RDMA-nldev-Add-dellink-function-pointer/20260307-155949
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/shuah/linux-kselftest.git next
> patch link:    https://lore.kernel.org/r/20260307075611.3410-4-yanjun.zhu%40linux.dev
> patch subject: [PATCH 3/4] RDMA/rxe: Support RDMA link creation and destruction per net namespace
> config: loongarch-randconfig-001-20260308 (https://download.01.org/0day-ci/archive/20260308/202603081310.Lo0y72dG-lkp@intel.com/config)
> compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260308/202603081310.Lo0y72dG-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202603081310.Lo0y72dG-lkp@intel.com/
>
> All warnings (new ones prefixed by >>, old ones prefixed by <<):
>
>>> WARNING: modpost: drivers/infiniband/sw/rxe/rdma_rxe: section mismatch in reference: rxe_namespace_exit+0x0 (section: .text) -> rxe_net_ops (section: .init.data)

Thanks. This warning is fixed. I will send the latest commit out very soon.

Zhu Yanjun

> WARNING: modpost: drivers/infiniband/sw/rxe/rdma_rxe: section mismatch in reference: rxe_namespace_exit+0x4 (section: .text) -> rxe_net_ops (section: .init.data)
> ERROR: modpost: "sysfb_primary_display" [drivers/video/fbdev/core/fb.ko] undefined!
>
-- 
Best Regards,
Yanjun.Zhu

