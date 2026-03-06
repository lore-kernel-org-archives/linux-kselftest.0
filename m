Received: from frasgout.his.huawei.com (frasgout.his.huawei.com [185.176.79.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 021F43806AD;
	Fri,  6 Mar 2026 10:45:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.176.79.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772793918; cv=none; b=t5rONrL9yT7kDx7bhefVlfLTp/bncmIc4CfvIPSQqOGFxUYQwHQ4k/ejh6ft4GJs9Jo4qlGEDNLGX/zqrH1EipeIjPIpysUw4b8N/OdMaaApM9ALBtrXu6LIppu3nQzVE7lBB1qDJL8Ptiw7ugBSDFDee6kODKEJ6HG3XJyjg/4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772793918; c=relaxed/simple;
	bh=8T20Dr5Y2ol8p3ISqwn+YeQCbck4drnFLMVAwmBrZR8=;
	h=Date:From:To:CC:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=lZaGaajgypMEiR7RglC5j9NyestIGw5qV7pDYz5MJtsLpkQCHIJA2c8bTGKTj61tpGhn298kgeXpj1EOimxQ3T9v3l0ZlD/sCYsL18KaujI2p651dzTW7HpzTX3w13hRp3dpM+t4WOYDOOAE9q1EQtYz/eme8tiUOSBb50rk13I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=185.176.79.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.18.224.150])
	by frasgout.his.huawei.com (SkyGuard) with ESMTPS id 4fS31t3hYczJ46mg;
	Fri,  6 Mar 2026 18:44:34 +0800 (CST)
Received: from dubpeml500005.china.huawei.com (unknown [7.214.145.207])
	by mail.maildlp.com (Postfix) with ESMTPS id 6196D4056B;
	Fri,  6 Mar 2026 18:45:12 +0800 (CST)
Received: from localhost (10.203.177.15) by dubpeml500005.china.huawei.com
 (7.214.145.207) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Fri, 6 Mar
 2026 10:45:11 +0000
Date: Fri, 6 Mar 2026 10:45:10 +0000
From: Jonathan Cameron <jonathan.cameron@huawei.com>
To: Yifan Wu <wuyifan50@huawei.com>
CC: <tony.luck@intel.com>, <reinette.chatre@intel.com>, <Dave.Martin@arm.com>,
	<james.morse@arm.com>, <babu.moger@amd.com>, <shuah@kernel.org>,
	<tan.shaopeng@fujitsu.com>, <fenghuay@nvidia.com>, <ben.horgan@arm.com>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kselftest@vger.kernel.org>, <linuxarm@huawei.com>,
	<xiaqinxin@huawei.com>, <prime.zeng@hisilicon.com>,
	<wangyushan12@huawei.com>, <xuwei5@huawei.com>, <fanghao11@huawei.com>,
	<wangzhou1@hisilicon.com>
Subject: Re: [RFC patch 0/9] Add support for HiSilicon platforms and
 refactor
Message-ID: <20260306104510.0000437b@huawei.com>
In-Reply-To: <20260304040334.765860-1-wuyifan50@huawei.com>
References: <20260304040334.765860-1-wuyifan50@huawei.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: lhrpeml500011.china.huawei.com (7.191.174.215) To
 dubpeml500005.china.huawei.com (7.214.145.207)

On Wed, 4 Mar 2026 12:03:25 +0800
Yifan Wu <wuyifan50@huawei.com> wrote:

For v2 onwards Make sure the cover letter title includes
selftests/resctl as with the patches.  
People use that title to decide if they want to open the thread
so it may be all they ever see.
