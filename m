Received: from out162-62-58-216.mail.qq.com (out162-62-58-216.mail.qq.com [162.62.58.216])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B917A54763
	for <linux-kselftest@vger.kernel.org>; Wed, 28 Jan 2026 02:10:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.62.58.216
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769566226; cv=none; b=gjDBft4V+YrhRQABJin3D/Bl/ZZH5DxLQxUGJzLT9LWBPW2Ntm9gytdBrRH8dnxxXf8KYJYR8U8NST4ySCAiKN5MW2xN2WLreSKzouGWK8MOhEuzXFZoPhkIo4DVt1a41emHOmCDZTBuwsbdsQe5PVRth4pLNfFGkL7EXafXcys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769566226; c=relaxed/simple;
	bh=cFUN/tuZl/q277eENAwIhI3gsMQmj15xOMsbONDnb+M=;
	h=Message-ID:From:To:Cc:Subject:Date:In-Reply-To:References:
	 MIME-Version; b=W90/fxWLVSTaMuw12BfPQmgGOE/PArsix0JNoAZWbMZ1ZKbBbhzSmEsuimrfZCZbYCOQJHHFKvQntqPvCZ4Jqn9SvnLBEDdhkiC/EoVn/i0x+zRrN/XD6YjxIJH+rDRtMzp2VYM6wtgfwV2FDDWvJLDDtP7yUUZliNSnXZB6NE4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foxmail.com; spf=pass smtp.mailfrom=foxmail.com; dkim=pass (1024-bit key) header.d=foxmail.com header.i=@foxmail.com header.b=HNadvb2Y; arc=none smtp.client-ip=162.62.58.216
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foxmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foxmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=foxmail.com header.i=@foxmail.com header.b="HNadvb2Y"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foxmail.com;
	s=s201512; t=1769566219;
	bh=ZDMjdtcS2U+8Si4tarTHmrXpuHRxxtsI2/MftaAbhHA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=HNadvb2YxFU7RQcadoF7obDEbLD25zRzQrVRCP4NQ1O8HlTiiRNccVy+NqvxDqwPP
	 gIRHcPdLTfhMf1u3LfcSu6KiinihK5/SOjP5sAvFmZEZ30DZ2wtU+5IVzBD5Fx3L3W
	 vapT85olYBH6htIws4uzy86jjcXrDF0SyfCNaPjk=
Received: from meizu-Precision-3660.meizu.com ([14.21.33.152])
	by newxmesmtplogicsvrszb43-0.qq.com (NewEsmtp) with SMTP
	id 2441BEB3; Wed, 28 Jan 2026 10:09:04 +0800
X-QQ-mid: xmsmtpt1769566144twsuwpc6z
Message-ID: <tencent_818A62B821C6515C69CE51F3D6BE90BA9E09@qq.com>
X-QQ-XMAILINFO: OVFdYp27KdlJRMZHhev/0WCU6iw+OL8ppcXZK1QedhcTw1yRVS/lgP/BlrkJqi
	 8aDKRPNaz8OF5j3aWHCPWAZzcUJgFJ5sTkPY8z1deLAtC7Ik6mWps8fnPg66+NG0Vm+0QnXgF49R
	 jGEC3SodjUIFnEkI5MEXe+YQbXSjkqtfCnUdDh76dyONl9e9eqZlKmE+1qpMXmEilWfxO0P1iyAI
	 oCkr9kjTXepSPSrcIo5rovV9lB3K0KSMVLEJ8643FBM36ZpoAK222IriLKw43ybCQOoeFhxptISs
	 wQQzoLY1S4llAc3APS+8zUVhe2lsi5BE4SwS3j1vk5hggh9Qg2YHWxTSSReNp2of00AlxxXgMtgE
	 ctoVqVhpJu0LXMP0LcvAeaDM/W/ntqRqIikQY0ZGa/JJvxC6jsV05edZyLwIisfuhONZFbQ/cjNz
	 JJukhx0sRDW8Wpi0rWCffUok+9okuJaPlj76o5T/zQZtvS84jl6QVAszMlvmEQLcEtBgvA0X+RPi
	 hEF5C+5JeOmb4OHf/p4ImGfEHIrFl3M2QSKhHBnhshqHPDd3iCx72v3dgB41tJrywQXs02Tt+wqB
	 urY+ZTsxrYNRuviQFgdm3rzokhzWK/Wu6MXjyBgIqBCyjv1s+j3OIn+WtxGYC8tPtK11HmewCjNY
	 ishrZXFaSrjdjO15e00ksk0KT7VjK5ddxkTK89FSILkt2iue3iB3Q7vpRU970+LxDJsUuTqSC9Ls
	 gwm3T3SmwxiVZE8keiO+f+G8F0Np6+s37RUoyrSxbsSjaP+zETDTYqqkmw3b4n81cAViqHCra2Ds
	 l+RI3U2z+/MICwwUgcre9QiEJVGlY6ZOGMCBuO1fmnqgov13vpbSH2vUVw0/babYdxF3tiESOPRf
	 N2FIShzDeLJBblaKSLZ5drTk8/G2L8rvjc2hDdjT8hhNg7/eVLSt370YF/nGhJiw3uj2nW25E9qA
	 HQcl0XysWK05jHyfwm4lvQIX7HNIyWW9mZk/GgUVRqNhfs1WIXj/Hcanu4Fs9JfMaUcMIDnRICzV
	 CxaPwauVJC2UYV0ssjH+8H58/SLsKb84r1Ks124q29ickO3DJYeKUJXTqhcj7bHMDKA9IqUcTf/a
	 9N6nd+
X-QQ-XMRINFO: Nq+8W0+stu50tPAe92KXseR0ZZmBTk3gLg==
From: Yuwen Chen <ywen.chen@foxmail.com>
To: tglx@kernel.org
Cc: andrealmeid@igalia.com,
	bigeasy@linutronix.de,
	colin.i.king@gmail.com,
	dave@stgolabs.net,
	dvhart@infradead.org,
	edliaw@google.com,
	justinstitt@google.com,
	kernel-team@android.com,
	licayy@foxmail.com,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	luto@mit.edu,
	mingo@redhat.com,
	morbo@google.com,
	nathan@kernel.org,
	ndesaulniers@google.com,
	peterz@infradead.org,
	shuah@kernel.org,
	usama.anjum@collabora.com,
	wakel@google.com,
	ywen.chen@foxmail.com
Subject: Re: [PATCH] selftests/futex: fix incorrect result reporting of futex_requeue test item
Date: Wed, 28 Jan 2026 10:09:03 +0800
X-OQ-MSGID: <20260128020903.406756-1-ywen.chen@foxmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <871pjac3a0.ffs@tglx>
References: <871pjac3a0.ffs@tglx>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Tue, 27 Jan 2026 19:35:19 +0100, Thomas Gleixner wrote:
> This is an actual fix and wants to go _before_ adding hacks to solve the
> my system is too busy to start a thread in 10 seconds "problem".
> 
> Thanks,
>
>         tglx

Thank you very much for your reply. I've resubmitted a new patch.

