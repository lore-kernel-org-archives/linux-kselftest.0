Received: from xmbghk7.mail.qq.com (xmbghk7.mail.qq.com [43.163.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E93A537DE80;
	Wed, 13 May 2026 11:49:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=43.163.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778672965; cv=none; b=B+x7E/m2KB9LgBU4kCeLP9TRZD+SiN5tKu8tH3W/PPA47m/IT07FrAGTBzrVbbYsqt0k+c8x770NYdRrmdeYPaDwpvQaNwVlgUNdeD2jooOSD59i1Zs3wiFMot7cPA+2M6mXDor89Rklg2vfPVqqu5Pt9vjSVDAvpadKRlXBpE0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778672965; c=relaxed/simple;
	bh=CpBtpD26hJi5W/nbKNLKTl4TLBMQhgSwkAP0JzD4xOA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ybnkf6Gb1WQLc5Cr12zhN/hiOGWvtwiNGVMBJlmHCWvGB1UWzZgBFpdvlC/rinwnyz5ueLR19JZwFeJUTlCk3BnO3n0ub16GT2pkx6dZ4kcV4d6gKoLxdpo3iUCbBuUOH97pwJcrFiVQniBF9U0XT1ph86+pHhg66fZY9XD9iO4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com; spf=pass smtp.mailfrom=qq.com; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=zVUopWNw; arc=none smtp.client-ip=43.163.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="zVUopWNw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1778672952; bh=uIHzgVbli95YXrDt4r2xvjhCuHt4WOuS+wHLnD1yRAk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=zVUopWNw9aNcwtzywGGC5TZY7DuATPUgX4dfwLibSvuRYOeNYMFdFqFkFqYs+BoVs
	 kwNDvg0dH87LkDvePMdiFS4LxwyPeq+LTt/GVuSpUbJbQnD8Rw2al70hayEX+5C8g3
	 ukIvPJ60btTWN9G2lqx8bn6AXg4nCWyqqkl13KIg=
Received: from [10.46.141.45] ([36.112.3.68])
	by newxmesmtplogicsvrsza73-0.qq.com (NewEsmtp) with SMTP
	id C4A0F68C; Wed, 13 May 2026 19:49:10 +0800
X-QQ-mid: xmsmtpt1778672950tq981p33l
Message-ID: <tencent_802CA0B9BE9F8F159FE6913C7047906E1E09@qq.com>
X-QQ-XMAILINFO: MRMtjO3A6C9XRE5vbLvVJpWGcifG9l5x0ln1XGQ5ij8pr4bXVPr1TdcKBYayMX
	 eUQTsFddOJYgx8GeiaYnvVX5tkQPII68Ti9BxdcnVctSLx8ufX5SAGBUtguBoe4VTKwlN9GqEOfM
	 FFCorW6oTpL5Z8Sgi8TVNTtnrNhGTtfADcbYmmqpvI07QSe8qB8TgQjRIN+PtbRlEC2I7hehN1s+
	 Jho2YNdsh+Iv2uN3X6XPYfbHoRIc4KmOJ7/dlasRgIniTrG5+Icocybb3KH48TOsLPUwFDK2n16A
	 +I1qTvzzMrePlrd4jSf7N6Kz29hM5slotiKC9snrQLNgDx+8eTI+b7+hfh4D8ZWyCNwVcsdt77fP
	 S+5pr4pJvMIs5JpmfiyKUVDArvlLQuSe0XP3QrMDcsZzF1LpoVaIOtmVJwTZXx5r9BLoR8Dp5qdP
	 roRHqmznXP7cU5BGE0nF2Zd5WtzvaEAhA7zjotWe2qNq4uC5SNbH5/qDQ6L74tzMF4BVd9o5p2Kf
	 teG+3HJ6T3tUEGHTdxE6Ms7W3ZlrPF48otKboWcdGa+nv6QhBqyHW457A7wCgiy1t8uHf3NOJMhK
	 xsRv+ivkVoN6QhwYd9zvOj/0BYtJBdft4hLsaqq/bjlfdAkpv5eMKZ+ASFjER7s1sQ0DSWtjfhlz
	 hbDB9eBDSNxpbb1REchXH4Yz/YYs5obINmiQt0FExJtL4BCNuh5sdZrt3SpKwDOOKNsy2tzTCSdV
	 otuMLbkq70coFnBtlQlUXV4oo3GJYIs/280E8yc4/6HStfQTUO8GCMk+XH0cpalFyGhIV03tqpMq
	 dJR+Wae7Iw6trUR9NPPG7bXcjM0jtSaHR+w5mkDS0lEBeyUXCXRX1rufclHoocQnkXUwA3sA3fJW
	 Q5iJV1eHq9I16oE39eqbszEbbjCPK5jWUCk9oWdz+UsY5O0c7e6g1ap+LxjGgmM6SCktO9sdQaX+
	 WNJHiNsmmMLFRblk0E5r6noeRXyoOwBkUeNidzBRsvBg7XLGofVBdcyELtFGrZYgqsDaIC5FErxh
	 rycUkzxkrY6P64q99S1/51hMPz4Vk=
X-QQ-XMRINFO: OWPUhxQsoeAVwkVaQIEGSKwwgKCxK/fD5g==
X-OQ-MSGID: <3fe8e232-66c0-4b41-83ee-b5b27c9c175c@qq.com>
Date: Wed, 13 May 2026 19:49:10 +0800
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mm/mremap: unmap full fixed target for multi-VMA moves
To: Lorenzo Stoakes <ljs@kernel.org>
Cc: Jann Horn <jannh@google.com>, Andrew Morton <akpm@linux-foundation.org>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>,
 Vlastimil Babka <vbabka@kernel.org>, Shuah Khan <shuah@kernel.org>,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org
References: <tencent_863C8A01F3C81EBA238F375B16065CBACF08@qq.com>
 <agHmO4i4YUhs3cSG@lucifer>
 <CAG48ez1sLtSKVQLHbLO5usBgMgjyOGhbX29pKEfku4Ht05HffA@mail.gmail.com>
 <agH1ZSdX_7QF8P_I@lucifer>
 <CAG48ez17evhhcoDKF6AoPqzYZwGuFCkVAsc-0bBzevf0LHYNxA@mail.gmail.com>
 <agH7ONBSX7XLzS6q@lucifer>
 <CAG48ez0y3N9uEOzvr4N85Js4XN1fh4JiUFjW=PQB2UZ_5t1R4A@mail.gmail.com>
 <agICeiIEshWf-1xa@lucifer>
 <tencent_B49EC91555E7B93CE646566E0A2DBEB9BE09@qq.com>
 <agMyDHx5MxR0igFY@lucifer>
From: Fujunjie <fujunjie1@qq.com>
In-Reply-To: <agMyDHx5MxR0igFY@lucifer>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 5/12/2026 9:59 PM, Lorenzo Stoakes wrote:
> On Tue, May 12, 2026 at 03:24:24PM +0800, Fujunjie wrote:
>>
>>
>> On 5/12/2026 12:30 AM, Lorenzo Stoakes wrote:
>>> Yeah let's go with that then I think :)
>>
>>
>> Thanks Lorenzo and Jann.
>>
>> I agree that the patch as posted goes in the wrong direction by treating
>> source gaps as ranges that should be propagated to the destination.  Please
>> drop this patch.
>>
>> If disallowing source gaps in this multi-VMA move path still sounds right,
>> I can look into a v2/new patch that rejects sparse source ranges up front
>> instead.
> 
> Sorry I really want to think about this a little more + make sure the
> semantics are sane, so I'd rather take a look at this myself.
> 
> I do really hate to take something away from newer contributors but in this
> case things are quite fiddly so I want to make sure everything's correct :)
> 
>>
>> Thanks,
>> fujunjie
>>
> 
> Thanks, Lorenzo

No problem at all, that makes sense :)

