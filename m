Received: from mail.zytor.com (terminus.zytor.com [198.137.202.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2152437F01B;
	Mon, 23 Mar 2026 20:44:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774298644; cv=none; b=L9YR6uD4UDXG1prMTEwAcgnpt9j+ZpQ4vDmquyLgSDp89kGQbvFCuk1Ca50LSRN3cSJUXF0ruPePDwNpOxGXkBfV9EmoOvHDmbakZEGYn+f+PderIDKmELl/PVOq52ed+jA6HeIlMNAwmY0IKpeOTeYOIiHW0ERsSIffiPKyxnc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774298644; c=relaxed/simple;
	bh=vXqcipqgH0S3NtrVzXRwJpgdgKtE+evTaBXC41Pu2Fs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kKA6T9Hb+LD41oQBV951+SvX5ulokVvxke0Slr932MG5dQb6ykD3uSJ2in9M1KIVsO+Cxb4tQzIz+3VaVgo/RF0BKeJX5wWPkTXVGMvJ1V86iRUZJflGBfci9uc5Y7F+BP5oR+VdKZkyJBg8VVlzDMfQA4Ntm9rPwwoyFOe1THQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zytor.com; spf=pass smtp.mailfrom=zytor.com; dkim=pass (2048-bit key) header.d=zytor.com header.i=@zytor.com header.b=i+qODxGq; arc=none smtp.client-ip=198.137.202.136
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zytor.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zytor.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=zytor.com header.i=@zytor.com header.b="i+qODxGq"
Received: from [172.27.2.41] (c-76-133-66-138.hsd1.ca.comcast.net [76.133.66.138])
	(authenticated bits=0)
	by mail.zytor.com (8.18.1/8.17.1) with ESMTPSA id 62NKRjba3137652
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NO);
	Mon, 23 Mar 2026 13:27:46 -0700
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.zytor.com 62NKRjba3137652
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zytor.com;
	s=2026022301; t=1774297667;
	bh=BWtD0ju6ZbiaJZB565d+DPNEOTfQ40hzPlXd4Ui8O/s=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=i+qODxGqOKlYHHLnBrfAmILbKuj9Cbkp5WLvTAoLs+KhUxpK8AUtstaLw2auSnXFW
	 J0GGSE1FyD7uCwTgqOxFoHwv81c1bWnnURD8u2+byhMRcz0OABTxJs8Yng7NIL3VkT
	 GlPxX6zi1bBGmPLfcz22ETJG7sxRawV8b+aIX5VcYADay55+vhLBOh3Y1+6P20Ro74
	 QSX9VIUjDQzzB2FW1sPYXyte3AL/su1ZrXy64cnoKox82vfWOZ7VxGygqAtvEK0wcq
	 UfqAY6R68M/ZRijcDlXQlfVhybUfnl013V1b4Z/TiQdJUawWpmQ2FlyREK4B/19D9s
	 bofyJO5F1Xgtw==
Message-ID: <0200a8d8-6871-4ff2-8c6a-968c2cb39a4f@zytor.com>
Date: Mon, 23 Mar 2026 13:27:40 -0700
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] selftests/x86: Fix sysret_rip assertion failure on FRED
 systems
To: Andrew Cooper <andrew.cooper3@citrix.com>,
        "Lai, Yi" <yi1.lai@linux.intel.com>, Xin Li <xin@zytor.com>
Cc: Dave Hansen <dave.hansen@intel.com>, yi1.lai@intel.com, bp@alien8.de,
        dave.hansen@linux.intel.com, linux-kernel@vger.kernel.org,
        linux-kselftest@vger.kernel.org, luto@kernel.org, mingo@redhat.com,
        shuah@kernel.org, tglx@kernel.org, x86@kernel.org
References: <c6c2ad7c-c307-4e8b-b2de-55e807f2c41f@intel.com>
 <43f2c5c2-6327-4546-b204-5c66b704042e@citrix.com>
 <568aa6c4-6802-4eb5-b412-e3aa93ed9b29@intel.com>
 <91590BC4-A54E-40F4-A223-A07FBA386A9A@zytor.com>
 <acDYXtVgSKbbAuGs@ly-workstation>
 <ce764071-6670-41a2-923a-88f1cd04b238@zytor.com>
 <c2979413-62f4-4a35-ad64-be2b8f55ea04@citrix.com>
Content-Language: en-US, sv-SE
From: "H. Peter Anvin" <hpa@zytor.com>
In-Reply-To: <c2979413-62f4-4a35-ad64-be2b8f55ea04@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 2026-03-23 12:17, Andrew Cooper wrote:
> 
> This doesn't really test whether FRED is active.  It tests whether the
> OS is not providing strict backwards compatibility, and I think will
> malfunction when there's a hypervisor above Linux providing strict
> backwards compatibility.
> 

But that applies equally to IRET, no? If the hypervisor clobbers the segment
selector like IRET would in the interest of compatibility then you have the
same issue.

If the guest is running a FRED kernel and the hypervisor goes in and mucks
with the state after ERETU behind the kernel's back I think you have a much,
much bigger problem.

	-hpa

