Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D706F36B92D
	for <linux-kselftest@vger.kernel.org>; Sat, 26 Sep 2026 19:17:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790450273; cv=none; b=PlgEi0FXlcaT8YFVxO9kTHduQB5RXFgg7bQ7QF2uILvZusMKuClIeUpnRUEPkFRhy1KfsE4g/2jRUPZCPEp9SzxRaUi8esI2QFi/OTvRMWYZFa1gEXwfAjmpb0N75gnPBMHFP2c8Wi8SWLpTRk97XZqL0H9upvfKyZ2oXsq+do0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790450273; c=relaxed/simple;
	bh=SENCACLexSUZEGoxCx19wet45SCiFKEyVku1ItHIA0A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WKaTSndQLyMagpxEYOoIxHCHkPOYmaMjzhWE5o08779KvqlIGQQjamnds01vPEVurH6EJ8qCZp3fuBXpEC9BiPLHRF6zW2MpUNDkylIWW43fZBx1EfTWO34QPoG07YqOIuSaSM2BwKaRpeoOkXMieEbHYrUyVmlaKGQUFq+9tQw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=iaCHR5HW; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="iaCHR5HW"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49ff9621c5dso4710235e9.0
        for <linux-kselftest@vger.kernel.org>; Sat, 26 Sep 2026 12:17:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1790450269; x=1791055069; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xQXXyBLSen0VAh3DFIGOgeMpVCca2cQf5px3cYaz9PQ=;
        b=iaCHR5HWZlSg+CNub6ltkhx7jVZFYY0bLd1Vi5X3dCF81CqFC6Rt0nzzPtuteI58+b
         4NwYHW1VJyecB+ehZ+AJ8TIMrYADgjuCEy0rMfDBXEy2QIm8y9ow5OzCykYVsJKDASSB
         2duKwszJJtQ1l9Z6IYAUX2HwhZ+Hcxsklk1Jw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790450269; x=1791055069;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xQXXyBLSen0VAh3DFIGOgeMpVCca2cQf5px3cYaz9PQ=;
        b=TNtiUbYhXulNrWvclUshAWbM1rfYKnWHC6Wyg12JtwnRTW559LrlwegpVLrkE3AO4N
         V49XBQhZ1cz+68rkIMkJsiBhO5hgASWBVVeLh8cvsYEwjU0SwY+Dg7hz4pftwM0AE10f
         KGAP3DicYE4iiG94OkRTTEw6f7NArPIpLXPR3QZEH+IxUMGliDKIPVS+SIwAgvQUiymF
         Pfc9iK6kRz9BO5eAT5h3XuonHFJvnhhQd96zRrPRi9OSWyDkhMPZ+TdPHbfzOIRtlCI4
         3sN1Fi0jttWgtSG2VOAjeLK/IoxuAvI5pdgBsWGxVDMMYlVDDuHq1L90Chr39AN0ZpAU
         8hAg==
X-Forwarded-Encrypted: i=1; AKwUvBx9GPufGWXkve0cUiq2GZ7dufD+2741wuybnTgphGZgQ03uyOaKfCpi1gAyI3X6npUBg5H2BiWk7B4KJY3eFks=@vger.kernel.org
X-Gm-Message-State: AFuF++kaw6XMGwT3SAsg7XWaaQrez8yFE9hIuBEiuEiMkmZincM4Jb4X
	CbqnG6k6VovDWL3s5bDQAGk/nnO6zi30kr710wUZ5Z93/b6CThUq+ozmURE+h+I1HI11KjeLCV4
	Ap2GPcKqFDQ==
X-Gm-Gg: AYBFou3s+JTvrKuehp0WwEeT3nvV+TL3laivbIJMtT01Qzrx/hRetAjRBd9xT9CfrFF
	Fto62fcZBJPUf7cE2kKRzwCajXvhK+mNTyU0NFdHnpeovYEgV4Bp0WiB3DcaPQoySoBLmBmVrpy
	O6xM6DIj7ogCFr/L7766EtBscPqhLV01Obj2EOphEcptZ5X11Bn72VVP7y5C2ilPmxfoyj2lJ8/
	dHrcdjbhsxsran86AgbuylqkDA7JFPkoJzKbR/SxDmxHdeUT2JIeLCESxyKiclczoYyEWdbqAtQ
	pzWZr3aQZcMa20fee06knRa4u0LY6kmSzX2/mhDmooklnzOhR+T4CW/QAlvtXEUeSJBjOTU4uVK
	eVYoHCu2mIy/mfrm37E00g6GX6VFsTXY3IVCV3SRC6uq4hy/zapXvHswBb5FAlZHfRBTpC69BTD
	67MMQtatuNEgp4lADEWEbAJmM6la4G+ztqdzwTYTb5+O83pH4YPsdu3KYpJ0oln0h+IdIqEvxsS
	8xiRafPo8dzd+8LfciWVsgliElPTpy1N8qfLpKCPuQ+cVtdQLTClpZn+w==
X-Received: by 2002:a05:600c:3507:b0:49f:c432:2e50 with SMTP id 5b1f17b1804b1-49fe66dffdfmr178360545e9.25.1790450268904;
        Sat, 26 Sep 2026 12:17:48 -0700 (PDT)
Received: from [10.188.205.27] (cust-west-par-46-193-1-237.cust.wifirst.net. [46.193.1.237])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ffd66aa24sm47235775e9.14.2026.09.26.12.17.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 26 Sep 2026 12:17:46 -0700 (PDT)
Message-ID: <f70a489d-85ba-4b95-9bbb-42d4a37eaff5@linuxfoundation.org>
Date: Sat, 26 Sep 2026 13:17:44 -0600
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: resctrl selftest patches ready for kselftest "next"
To: Reinette Chatre <reinette.chatre@intel.com>
Cc: Shuah Khan <shuah@kernel.org>,
 "open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>,
 Shuah Khan <skhan@linuxfoundation.org>
References: <92c35a79-1c8c-4543-8fa0-0ab78b05faae@intel.com>
 <CAKRRn-d+72is6hNnyTvxUWg0mRWm_BDBcqHZY0+ahdzoNJV=bA@mail.gmail.com>
 <78508c04-c9f9-403e-b13f-220a3d74e956@linuxfoundation.org>
 <3aeee5ab-8a58-4702-90e5-0e69171a5e1e@intel.com>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <3aeee5ab-8a58-4702-90e5-0e69171a5e1e@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 9/25/26 14:40, Reinette Chatre wrote:
> Hi Shuah,
> 
> On 9/25/26 1:07 PM, Shuah Khan wrote:
>> On 9/25/26 01:56, Shuah Khan wrote:
>>> On Thu, Sep 24, 2026, 11:54 PM Reinette Chatre <reinette.chatre@intel.com <mailto:reinette.chatre@intel.com>> wrote:
> 
> ...
> 
>>>      There are a couple of resctrl selftest patches that are ready for inclusion:
>>>
>>>      "selftests/resctrl: Skip L3_CAT when no exclusive cache portion exists"
>>>      https://lore.kernel.org/lkml/20260821003908.12977-1-icheng@nvidia.com/ <https://lore.kernel.org/lkml/20260821003908.12977-1-icheng@nvidia.com/>
>>
>> Applied this to kselftest next branch.
> 
> Thank you very much.
> 
>>
>>>
>>>      "selftests/resctrl: Add dynamic linked list management for IMC counters"
>>>      https://lore.kernel.org/lkml/20260801092429.533956-1-wuyifan50@huawei.com/ <https://lore.kernel.org/lkml/20260801092429.533956-1-wuyifan50@huawei.com/>
>>
>> This didn't apply. I am guessing picking this patch depends on others in this
>> series?
> Apologies for not being clear. I intended to request for the whole linked series to
> be included. When I try to do so all three patches from this series, specifically

No worries. I thought that is the case and just wanted to confirm before applying.

> 
> 	selftests/resctrl: Introduce linked list management for IMC counters
> 	selftests/resctrl: Replace counter index references with pointers
> 	selftests/resctrl: Enable dynamic management of IMC counters via linked list
> 
> applies cleanly on top of kselftest "next" branch, currently at,
> 

All 3 patches in the series are now in kselftest next for the next merge window.

thanks,
- Shuah
