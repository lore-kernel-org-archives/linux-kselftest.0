Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795532596;
	b=BMkarrBGQkJx1rzyNmb4o7KZlLw5s/7YyGDlTWVM0mejashrCrADf/ZsmQeVxS6MIm//
	 ilt/7cEB20QOMRemLjpwdS6lkoTrvzcIe9PU5OgJ7s1ZD5GXWkPCPJGtw2zlP/dbSjCQB
	 L2pns7lAbxa41Q7QgHF1yCIUcFyXKwZqh9eAyyZGTYUflrCyLLopE/ihiPxvHrx21E/r0
	 CqNAV1HrbC95FECRtrinXRZs0CtDUbU7QmWVVM3AXKYm6q5KnG2sL97TRr2yjq5Iwk6P7
	 598oMInbDcNrlsDG/Y894C/VKinbhEhf/Xd0b3+x1G8CSzgfu1EUZI9mPwKFo4K3U0A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795532596;
	h=Received:DKIM-Signature:From:To:Cc:Subject:In-Reply-To:References:
	 Date:Message-ID:User-Agent:MIME-Version:Content-Type;
	bh=REPVVlJkeD+ZeFzs7zAo1+Ptfc+JAlFq2umyUtgb25c=;
	b=cPbqwtvkIF0wk377NvrZMm9xIxER0MBR0gSY/ItaZsyzJwCxTStx6S+osJGCjaECziGZ
	 Es6I++PVF3a8DH70hgfvSKzrqKB/yMicbycNr8ssCjP0/ZU1OFxPWnuiW6ij8zCTVGfuW
	 1H4O93lBzlVHO4YNRE/OeNEbt6bPr+PoqosYdRW3ldXSAtw7PWKkmSLd67hcvmz7+GRJF
	 Cahby+CxAHBS/Kjp95QgAQCeB21CH7fWex+EKrNdJCxD+oSXR3K7gmaAkqvD/6b2EOHFQ
	 OrB5gL2edAnaaZsLwINrYdSQFgnsu7vERfvtTqkZidhF59C8KEOzOU4XYRez22k3dQQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Rgt3qNyH;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F32BB606A323;
	Tue, 24 Nov 2026 15:03:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Rgt3qNyH
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E33E51F000E0;
	Tue, 24 Nov 2026 15:03:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795532595;
	bh=REPVVlJkeD+ZeFzs7zAo1+Ptfc+JAlFq2umyUtgb25c=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=Rgt3qNyHPCldkjic2773LwWjg9d3P/FLq5Qu1r0gEa12eaPtA6b7aA0ONNNWg+Q16
	 3MfPbdPUHrYiiRtHBN8UHBcbbVwSQH6Nxwtr4Vauzk0jdXWVWTNwZW2Q0U1jAkSg/I
	 a8jjMCJFLDOGujcH8zGjkxrbasfDekPP2ucvZ2rPiNWCHHS73zxGZWYhlzEVmPdvTb
	 YIAZGT5zRos71jgHCl5iotePibJWLcBWeFVNhUyF6P8IitYK6Ilzkdb+nYWenk4yzv
	 ZiLUWimuKPUmIfOmwI2kpapgw9Kn5gUqxdpMc4Swk2LhTfMzrU4jHWJNAuXbSZC2te
	 G3U/5Zf2x/zRg==
From: Pratyush Yadav <pratyush@kernel.org>
To: "David Matlack" <dmatlack@google.com>
Cc: "Pratyush Yadav" <pratyush@kernel.org>,  <kexec@lists.infradead.org>,
  <linux-doc@vger.kernel.org>,  <linux-kernel@vger.kernel.org>,
  <linux-kselftest@vger.kernel.org>,  <linux-mm@kvack.org>,  "Alexander
 Graf" <graf@amazon.com>,  "Andrew Morton" <akpm@linux-foundation.org>,
  "Baolin Wang" <baolin.wang@linux.alibaba.com>,  "Christian Brauner"
 <brauner@kernel.org>,  "David Hildenbrand" <david@kernel.org>,  "Hugh
 Dickins" <hughd@google.com>,  "Jonathan Corbet" <corbet@lwn.net>,  "Liam
 R. Howlett" <liam@infradead.org>,  "Lorenzo Stoakes" <ljs@kernel.org>,
  "Michal Hocko" <mhocko@suse.com>,  "Mike Rapoport" <rppt@kernel.org>,
  "Pasha Tatashin" <pasha.tatashin@soleen.com>,  "Randy Dunlap"
 <rdunlap@infradead.org>,  "Samiullah Khawaja" <skhawaja@google.com>,
  "Shuah Khan" <skhan@linuxfoundation.org>,  "Suren Baghdasaryan"
 <surenb@google.com>,  "Vlastimil Babka" <vbabka@kernel.org>
Subject: Re: [PATCH v4 07/19] liveupdate: Add helpers to track the files
 that LUO manages
In-Reply-To: <DN2SLUVNO0L5.3NUHFPC0J7QTG@google.com> (David Matlack's message
	of "Mon, 23 Nov 2026 10:13:37 -0800")
References: <20261111002358.1842967-1-dmatlack@google.com>
	<20261111002358.1842967-8-dmatlack@google.com>
	<2vxzbj7j3ga2.fsf@kernel.org> <DN2SLUVNO0L5.3NUHFPC0J7QTG@google.com>
Date: Tue, 24 Nov 2026 15:03:09 +0000
Message-ID: <2vxz7bi2z2z6.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain

On Mon, Nov 23 2026, David Matlack wrote:

> On Fri Nov 20, 2026 at 3:15 AM PST, Pratyush Yadav wrote:
>> On Wed, Nov 11 2026, David Matlack wrote:
>>> @@ -788,8 +797,7 @@ int luo_file_finish(struct luo_file_set *file_set)
>>>  		luo_file_finish_one(file_set, luo_file);
>>>  
>>>  		if (luo_file->file) {
>>> -			xa_erase(&luo_preserved_files,
>>> -				 luo_get_id(luo_file->fh, luo_file->file));
>>> +			luo_untrack_file(luo_file->fh, luo_file->file);
>>
>> This looks dangerous.
>>
>> Since the previous patch set luo_file->file when xa_insert() failed,
>> this will trigger in a failed retrieve. Except, the file was never
>> tracked to begin with.
>>
>> While I don't see anything that actually breaks because of this today,
>> I think it is a bug in the making.
>>
>> I think the below is a bit better. Although this change probably makes
>> more sense in the previous patch, since that introduced the problem.
>> This patch should just replace the xa_erase() with luo_untrack_file().
>>
>> 	if (luo_file->file)
>> 		fput(luo_file->file);
>>
>> 	if (luo_file->retrieve_status > 0)
>> 		luo_untrack_file(luo_file->fh, luo_file->file);
>
> Good catch, I'll fix this in the previous patch in v5.
>
> (But luo_untrack_file() needs to be called before fput() in case the
> latter drops the last reference.)
>
> So:
>
> 	if (luo_file->retrieve_status > 0)
> 		luo_untrack_file(luo_file->fh, luo_file->file);
>
> 	if (luo_file->file)
> 		fput(luo_file->file);

Right, makes sense. Thanks!

-- 
Regards,
Pratyush Yadav
