Received: from mail-vk1-f170.google.com (mail-vk1-f170.google.com [209.85.221.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B40E3A8FEA
	for <linux-kselftest@vger.kernel.org>; Sat, 17 Oct 2026 15:55:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792252532; cv=none; b=ubEXTKLp5u7ltPbjQysTzAo6YSA6jqGmlnNUnsFf8sn2HXXPnw/1djPkoeKd8FtaSDE0BWNoGF4GePrGKX0U549NJa0iaNzQBo3K44d9PPM6u2PydSYtTC34ABQNNxokx2GMTt9dEmYHeB3QABpFuaKImuPY23ZjvEpvfHiDc+Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792252532; c=relaxed/simple;
	bh=3pyT+YdpjS2XysUjWOV9STmcUoBSIxn/+89jRe06jnk=;
	h=Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type; b=EiF517dYQMdMF5aB/sAYKbw12/g2BNusjXGvF8Xfyjxl5KeQiyDZgSVDR84c5K3UriRXYDrIqEXrRk4GSt0JZeFOxYPHCuUeX9hmMwJVodk+aQqI2Z2G/GHCYVRtahGNgWuHu2HKivhXxK9pEf18hm5If/osa/lBQO1ho0TNvQs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=G7ToiXn0; arc=none smtp.client-ip=209.85.221.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="G7ToiXn0"
Received: by mail-vk1-f170.google.com with SMTP id 71dfb90a1353d-5e9a1f1681dso689236e0c.0
        for <linux-kselftest@vger.kernel.org>; Sat, 17 Oct 2026 08:55:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792252528; x=1792857328; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:subject
         :references:in-reply-to:message-id:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=7HIUZNWScATpZDK2J5WpO4C7vVI8kel4WHjrh6jwWL8=;
        b=G7ToiXn0i/t6APSVy+8u2t+72tFpMJksLnbvqKyMSTlk3qVvKIHFSGw2uPZUOkPm4I
         Hm+ts9U4iFu5QQ/XBuyn/MczBVUTZixb5ehTpN8qGaObjxnf0Bk4s0dgEMFG86WwEaYo
         Yst2qWY4tYyg89Qmwuzq27+q28Lt7E7svaQcj4bIfvnfxL3+XlUFG9m75/ZkhmzYXb9O
         uzADpV6wyKfZdJB2NwF7r5D54+b7E7JXBNTN+hylAKh2r06V57YWPgoGAXaW2Um0oLsj
         xI+lR1N9387AbNFAzef1Mj2aDpcT21XgdIlIKdCB8vdAYHnAe/0NsbvQxnW/OZi8Ozwg
         2Weg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792252528; x=1792857328;
        h=content-transfer-encoding:content-type:mime-version:subject
         :references:in-reply-to:message-id:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7HIUZNWScATpZDK2J5WpO4C7vVI8kel4WHjrh6jwWL8=;
        b=elTNIB8t35QlugYmDZTARnnU6bq4Ng8OJ8QWtGOqkKXNmS50S0bdySkL5E7vklIrpK
         dKtd36KXJxic6d7Ag8fTRyYeukqOvZ1sxpJu8thgcoXjiykRUTuC2rZ7c+uSCcERn0Oe
         AXnhVzazOuUGsmzEfNkwON+r9EXVExNJNYjSIJTxtnMTHGt19BACusFRIF4aJyMmUhMU
         Ls8oog0UAymti7KXMHd3nVRQpATpBixkuUI7Z6Gm2f+iBrGr/lAYaCbyUVMPLR+yhZ1c
         aQW5IBOpCpB50Pm6an4SR1dJn/WZfWBHrzntMIb7fZ+cEeIHuLvKN0FWEDQ6JiHGJ8sq
         ZZ1g==
X-Gm-Message-State: AFq9FYL2wg8SIfjQHfQkcpwl7jQlJXYocgTNUW2dj6cZ+M2cmpHVaB1Q
	3lr3sxccZK0qYk5vGHPDwOlTR207YK74c1b22daxsHAEhuIyZDga7poa
X-Gm-Gg: AYBFou0qzS9ridMIhQSgFm1NJZZJHopxjyJtW1pmVJld/7k7USvfRupRgZ86HQqt5DM
	gKybNfeZsYjQFD4RfYVHWMf/Rn6WXRXruG7WNqlTNFC5BUfi2xn1gF6HLcbJC3VvwkbWvBASSzb
	DAFAY13tFRjKHlOlfG3Me6Q1zx6+LiRGxZLHL5WvDwg5vW9/ohLH/ahvo3OsHRNuLgEAZDF2wCZ
	VXtk7gUKXvLqo4MbPzP6xnEpoIZOk956eQj9c0lB1YFO4IkVRYIUiUN4JhlvCPBrBlRhL1l4lO6
	0+AC7X1p+ddBFKeujkPSMyWqirxAp8KlBfUvExJu08Tf//dy9/LzF2+97kQiiN3QLwAn7b69283
	TFYeNgzOThVdXMx4gD9fh9xkPGsUB9g440yhq5R+dhC1DXdw15MiJd0BJNudxstbDIncw/pWuDL
	OM7ksTXlv91UnIKXXsvhlw+ZqKadkG1W15R15wtDY+Ept9LLIYkmhhcJ7M64Eo7W6UHvgi4CCor
	1cy/Zt5PBkNlosh8eqQoJaMGayM6jb44DktThLBwIkS9vWKUtotfr0jz7jjJNsDpDFJxJDkFS4j
	YL5r7KNUlORffrqd0+nIt3zkuDBodLvTOwE5qA==
X-Received: by 2002:a05:6102:441b:b0:7c3:90db:ed50 with SMTP id ada2fe7eead31-7cc369c0e9bmr910776137.17.1792252527694;
        Sat, 17 Oct 2026 08:55:27 -0700 (PDT)
Received: from gmail.com (111.46.245.35.bc.googleusercontent.com. [35.245.46.111])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5eabbd9ea2bsm492984e0c.2.2026.10.17.08.55.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 08:55:26 -0700 (PDT)
Date: Sat, 17 Oct 2026 11:55:26 -0400
From: Willem de Bruijn <willemdebruijn.kernel@gmail.com>
To: Megane Hebo <hebomegane@gmail.com>, 
 netdev@vger.kernel.org
Cc: linux-kselftest@vger.kernel.org, 
 davem@davemloft.net, 
 edumazet@kernel.org, 
 kuba@kernel.org, 
 pabeni@redhat.com, 
 horms@kernel.org, 
 shuah@kernel.org, 
 mst@redhat.com, 
 virtualization@lists.linux.dev, 
 willemdebruijn.kernel@gmail.com, 
 habte.yibelo@gmail.com, 
 jasowangio@gmail.com, 
 eperezma@redhat.com, 
 xuanzhuo@linux.alibaba.com
Message-ID: <willemdebruijn.kernel.eb0f6ff37e8f@gmail.com>
In-Reply-To: <CAJPVW+nstfbagm9GxQ=i-5J6Xi_aZ52-YiQZeYrzmPD3OmDNiw@mail.gmail.com>
References: <CAJPVW+=XcHDV4aoXt5oAHYh49kX7m5wUxf7TucrcBy+q6MdXFA@mail.gmail.com>
 <CAJPVW+nstfbagm9GxQ=i-5J6Xi_aZ52-YiQZeYrzmPD3OmDNiw@mail.gmail.com>
Subject: Re: [RFC PATCH net-next] selftests: net: exercise virtio checksum
 ingress outcomes
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: 7bit

Megane Hebo wrote:
> Correction: Gmail Web rewrote tabs and wrapped some long lines in the
> inline diff I just sent, so that copy is not suitable for applying.
> 
> The attached format-patch file is the authoritative byte-exact patch.
> Sorry for the transport noise.
> 
> SHA256: cd11c3970f0a23ac039cdfcdc6338c20c79dbff3db8fdc93ea53b4b8996437b8

This is not the way to send patches

https://docs.kernel.org/process/submitting-patches.html

More in-depth: with AI it is easy to generate testcases. We now have
to consider which ones are important enough to submit. I think we all
have reproducers for these specific fixes offline. If we had thought
it worthwhile they would have been included in the feature series
itself.

