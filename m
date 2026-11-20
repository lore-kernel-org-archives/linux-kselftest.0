Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.9
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795186767;
	b=NIijQL2B+x7grP0GliS8TXrFzqG1YlZIHN7LwYYqjA8l7hyi6WiJZRKWcetpYLXb+5np
	 ni/0O101Dg3JsFDW0GIQjd0cO6484Y/B/6kmfTsDAqF6WdHQQY/swEocTxHqhLJrk8UWr
	 fCV9nrsTIjzlkKBb0BEcDNV8ZNb57tATtupJU998lz7+LfTebXwPrw48K9jlUSlHigJZE
	 HnRPhX/f78RhqkJvZLBCLkAn5BLy1Y4e6ZAYNVpXnTFjPpyqrPznFBdulDdp0BcPIxjAx
	 JR9mr7/v+jJbF8BKNIxufIE3Vap0WYHWqEVHJYvREz0xsI8bBxqvReTkJIIWqDJJ/2g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795186767;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:Autocrypt:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=c5UK/oHXg8bKRXO+6H0HvxOr7LpOsnkTh1BTTna5mYk=;
	b=MybL2qBEgMMKiFj3O5oX4FyRZxO6BhZw/BJNccVJRfYrsZbT3zTNPrNPSAa2SG+Pt16L
	 rGi7h1HFadajl80TWsh6CNSt8ydboKdsKeJS4NV4VePMdBnhKgdKbuz1wNpKBR4D8yKx9
	 L3smloNWER9yqdV5kZx2JmtRvFVhpIFpdPNtLWXqEfFHzuqCXnA6HZsCrjVKUDg7S9RHo
	 ofHzq99YVnHtiG0xczlCq2QUYcug+6NmM43uvP3p+Acb2niTy4wC2eOLnsUHdp4afxOA5
	 pQ1Znam/pVStr3mBtCMB5MNJ7RnOB/Nu5IYIRJfSpiApUJu6qghASQI7YEJ3d+XWkfg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Vk9ftlwl;
	arc=none smtp.remote-ip=192.198.163.9
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BACC760A3818;
	Fri, 20 Nov 2026 14:59:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BACC760A3818
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Vk9ftlwl
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795186767; x=1826722767;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=hwifwDtSlaukaSzHL4eKcWSWnLIi5jafcPYLI86bwCI=;
  b=Vk9ftlwlORgDRCS3GM5U66zBg9COTsf4NzxyochVQn8ykdeogiFqWfiE
   nzf/jYjYDSZYMuk5fawblNGDvqXDPLut5mTM3JITTwIe9jlnhFuAS4+PN
   zO7OFirgz6rFa1fIiM9Dj9Mjo5qXSw6ns44mjVGRyO6wd96T2PqQlyaJV
   05LgOGqTjVJ15uQ3jh6G4t857ROdn08b/Wqsg74ml4/BTdimdRbB4yg8/
   ysHzCYZzAR7c0UsvI7XhNYfH18Y5Xj3s9laGnQ/eTpBNWLej9kYj5HDSI
   n6GeRDcSltuAMXp3grgFSC8Pxz1e5S2HUsHZQz68pijzRLQ9N4E8ot0aR
   w==;
X-CSE-ConnectionGUID: AF6Tt1rUT4+00l+U1OCtKg==
X-CSE-MsgGUID: v7S6i9lyTa65umDwu3MBxA==
X-IronPort-AV: E=McAfee;i="6800,10657,11972"; a="3948732"
X-IronPort-AV: E=Sophos;i="6.27,223,1787036400"; 
   d="scan'208";a="3948732"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2026 06:59:26 -0800
X-CSE-ConnectionGUID: JRVrLzoOQoy1lhLVKje70w==
X-CSE-MsgGUID: RNJf12G6T1eYFBGhNWuJjw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,223,1787036400"; 
   d="scan'208";a="12553917"
Received: from ssimmeri-mobl2.amr.corp.intel.com (HELO [10.125.109.123]) ([10.125.109.123])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2026 06:59:25 -0800
Message-ID: <ea383e6a-cf77-421c-814a-a1e074d3551f@intel.com>
Date: Fri, 20 Nov 2026 06:59:21 -0800
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] selftests/x86: sigframe_fpu_portability: fix TAP plan
 mismatches
To: Jakov Novak <jakovnovak30@gmail.com>, Thomas Gleixner <tglx@kernel.org>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
 "H. Peter Anvin" <hpa@zytor.com>, Shuah Khan <shuah@kernel.org>,
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
Cc: linux-kernel-mentees@lists.linux.dev,
 Shuah Khan <skhan@linuxfoundation.org>
References: <20261120134006.4819-1-jakovnovak30@gmail.com>
From: Dave Hansen <dave.hansen@intel.com>
Content-Language: en-US
Autocrypt: addr=dave.hansen@intel.com; keydata=
 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
In-Reply-To: <20261120134006.4819-1-jakovnovak30@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/20/26 05:40, Jakov Novak wrote:
>  The plan set to 2 with ksft_set_plan(), but check_avx_support()
>  may call ksft_exit_skip() which leads to a TAP plan mismatch.
>  Move the ksft_set_plan() call after the check is done.

I'd really like to know more about what this is fixing. It's not super
clear from this changelog.
