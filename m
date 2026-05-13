Received: from mail-dl1-f41.google.com (mail-dl1-f41.google.com [74.125.82.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 089B22D29C8
	for <linux-kselftest@vger.kernel.org>; Wed, 13 May 2026 22:54:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778712845; cv=none; b=LfpUHCNJrFvCpDzPFNRRM6XWLqEYx6lOrSaUEQD/LT9nNhFPu9YvfMEFFNxJiL9d5lRV8NxL/0i6GR+7HqITH38WZ55Pf6jpuqjF4CmM7OABiw3uZVvBTxJgg8eSrBJ5ZuF0MtwciBOHGwSothvxHslssTIXBDXO9UL70K8d9Rc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778712845; c=relaxed/simple;
	bh=aa6l7b+APFWz/5UdNV5Q7GOrbwD0gYuiQ9o7noutUhg=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=H/17AHA6fqpdTNuEW0ycguDPe9pg42dehT7JGqZAjv/lSjxXJFCtxQXisAID3hDAI9EJsVowD88yoAcgES8sDoTIV6/gRS0N2ATPimiZG+yZeAqZl7Ed2yJoZeZSbRnQHYr85xUsRmBdm7LLdQ79VPoakpkjNQHuYnrVvuQjzn8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=j8Ybhon5; arc=none smtp.client-ip=74.125.82.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="j8Ybhon5"
Received: by mail-dl1-f41.google.com with SMTP id a92af1059eb24-1329fc4bf77so5675524c88.1
        for <linux-kselftest@vger.kernel.org>; Wed, 13 May 2026 15:54:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778712843; x=1779317643; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=aa6l7b+APFWz/5UdNV5Q7GOrbwD0gYuiQ9o7noutUhg=;
        b=j8Ybhon50iNTQHN4Xu4aOCf5VI+NTxIWF/q7L8EbUVy3HOBjoLyTBJEqO88GVGMrS3
         JuXDV9Dc1YyN4h/dG/GOFXxxYSEAYT7joGGWrOzpuhlcKxm5kK6bdr6VqLwpEE+Z6eVd
         6iCk0xcITCCQjBi6xsSXVNOb6Ortr+b2kqPOWLyEDr/AMzvm5LRfQC7Gc3JzavEyJkrg
         iPg/JM9xkTc6y271uIZF1dlG9A6nV5Ph0vEhgwHE6LNNvY/dElEt4OS4W1VF/zb3A0LF
         oGhUIF+wUFbIcztygZYeaRUY5cWTYywDVSwiMyWifPtZNPZD16H+vegaaQIQG+ODeeBf
         QWdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778712843; x=1779317643;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aa6l7b+APFWz/5UdNV5Q7GOrbwD0gYuiQ9o7noutUhg=;
        b=Oao7xwXrdMc2tvFDMMLfPfW4FZeKEENF/J2kWpybDytR8xC8Gysqr5s4CB4yzP7tPW
         cawclOhJ1auCmGM3uUjmWOZo6s9tWF2rnzB12VxwQZToHGg3Kx3VRPW2IpUVbJSCJFV5
         YS4rY0vaZ5uGKJTLTkYZH0ozRbUmz40e143IU2jGh4hNZc8mSIRC3Pg/zTRGIIZIM1wi
         rktsOd/iBAyaaM6lx6j0Ni4NsJU4uPj1jkj5hiE6HCZrLCT1m9rv9YgPWffXF+gwJAxJ
         fhnPtCVTEcCDo0U/hqH+n/3GUZXIH67Cm/JWfaEGbbMadH5BfHnkzWI2bcrb0wsqCxDs
         rwQw==
X-Forwarded-Encrypted: i=1; AFNElJ+BURWuHvVpVEb2+c1O2RdK+H9PSqK3TfkXmEP12m2LrpT2+Z/Tsg7w6MLiZ0v6T2uEkhJuRYNLgtTfI8xkIRU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxa3VqNUGaBlkBn9+egC3KaSnSjEazZ9USCvfvxs+Ud6H89/4s4
	y5sXdBXu9YQQINPa2LX386KJG8s119DBJmg5DI+uzP8m+xp9JV7Yesgi
X-Gm-Gg: Acq92OGtMNV7SGOLXQOLOHCvaLdk4FJxc8scwbdCSNn2mGYAAb8wS0hAbqvg21HgSSX
	k6TB9I8cdjP3pSbdtf3CJgpREF5cqrgpPMBC60aDNTvyZxJSS+Sx+gwFSb9KLtDXFy1h34GWH72
	xLIjE2+i/Zj4FdjxMQzKjOe1rTSP0z18Cs1t5G/7bok5U2LeltTUFc3eqVpzzXd3M92xqYVt89f
	ImNCr8U5I0mg9+muPe4Iaq60JIejcAuGs9wQEP8q0LQFglw6YzqV2Pr/OC9c9xhuoZK9yLYxT7T
	DeiMm9XdaRgPFQot4qdWC5CQKEYmBexfDWq/KKpbm/78GsIeHlXtoLIGQcuPhLNfEp2ozmUFoM6
	5EF1RRvWYlxHnx15QBC+oenH0nAZ5D8Aqm/CXchaK2X4GegOMdxgb9C1ccSXLDwRLJhyh9BPxqc
	IkNt3tX8ox2M6UTzL8sYzbv8CipVlrneZmKz+dleUTZMaouH+/LRplRl8hlC82LhEUOgirQMZr+
	TfI+ic=
X-Received: by 2002:a05:7022:6611:b0:12d:de3e:cc02 with SMTP id a92af1059eb24-13436bb037cmr3404126c88.41.1778712843089;
        Wed, 13 May 2026 15:54:03 -0700 (PDT)
Received: from ?IPv6:2a03:83e0:115c:1:5152:641f:f5ef:6c7b? ([2620:10d:c090:500::2:8a9])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-134cbed531esm1473485c88.8.2026.05.13.15.54.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 15:54:02 -0700 (PDT)
Message-ID: <e141699dab70282d811ec30bbf2aa8279706817b.camel@gmail.com>
Subject: Re: [PATCH RESEND bpf-next v10 2/8] bpf: clear list node owner and
 unlink before drop
From: Eduard Zingerman <eddyz87@gmail.com>
To: bot+bpf-ci@kernel.org, kaitao.cheng@linux.dev, ast@kernel.org,
 corbet@lwn.net, 	martin.lau@linux.dev, daniel@iogearbox.net,
 andrii@kernel.org, song@kernel.org, 	yonghong.song@linux.dev,
 john.fastabend@gmail.com, kpsingh@kernel.org, 	sdf@fomichev.me,
 haoluo@google.com, jolsa@kernel.org, shuah@kernel.org, 
	chengkaitao@kylinos.cn, skhan@linuxfoundation.org, memxor@gmail.com
Cc: bpf@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, vmalik@redhat.com,
 linux-kselftest@vger.kernel.org, 	martin.lau@kernel.org, clm@meta.com,
 ihor.solodrai@linux.dev
Date: Wed, 13 May 2026 15:53:59 -0700
In-Reply-To: <da95f45b43d94d17796b19abc4c555e35daafab7d5e1cdca3714fe0f54ab8cce@mail.kernel.org>
References: <20260512055919.95716-3-kaitao.cheng@linux.dev>
	 <da95f45b43d94d17796b19abc4c555e35daafab7d5e1cdca3714fe0f54ab8cce@mail.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43) 
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

T24gVHVlLCAyMDI2LTA1LTEyIGF0IDA2OjQxICswMDAwLCBib3QrYnBmLWNpQGtlcm5lbC5vcmcg
d3JvdGU6CgpbLi4uXQoKPiBXaGVuIGEgQlBGIHByb2dyYW0gaG9sZHMgYW4gb3duaW5nIG9yIHJl
ZmNvdW50LWFjcXVpcmVkIHJlZmVyZW5jZSB0bwo+IG9uZSBvZiB0aGVzZSBub2RlcyAobm9kZSBY
KSwgd2hpY2ggaXMgc3RydWN0dXJhbGx5IHN1cHBvcnRlZCBiZWNhdXNlCj4gX19icGZfb2JqX2Ry
b3BfaW1wbCgpIHVzZXMgcmVmY291bnRfZGVjX2FuZF90ZXN0KCkgYW5kIG9ubHkgZnJlZXMgYXQK
PiByZWZjb3VudCAwLCBhIGNvbmN1cnJlbnQgcHVzaCB0byBhIERJRkZFUkVOVCBicGZfbGlzdF9o
ZWFkIGJlY29tZXMgYQo+IGNvcnJ1cHRpb246Cj4gCj4gQ1BVIDAgKGJwZl9saXN0X2hlYWRfZnJl
ZSwgbG9jayByZWxlYXNlZCkgIENQVSAxIChCUEYgcHJvZywgcmVmY291bnQgWCkKPiAtLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLSAgIC0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0KPiAob3duZXIgb2YgWCA9PSBOVUxMLCBYIGxpbmtlZCBpbiBkcmFpbikKPiDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgYnBmX2xpc3RfcHVzaF9iYWNrKG90aGVyLCBYKQo+
IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgX19icGZfbGlzdF9hZGQ6IHNwaW5f
bG9jaygpCj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBjbXB4Y2hnKFgtPm93
bmVyLCBOVUxMLAo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoFBPSVNPTikgLT4gT0sKPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oGxpc3RfYWRkX3RhaWwoJlgtPmxpc3RfaGVhZCwKPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBvdGhlcl9oZWFkKQo+IMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoC0+IG92ZXJ3cml0ZXMgWC0+bmV4dCwK
PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBYLT5wcmV2LCBj
b3JydXB0cwo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoG90
aGVyX2hlYWQncyBjaGFpbgo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoGJlY2F1c2UgWCBpcyBzdGlsbAo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoHN0aXRjaGVkIGludG8gZHJhaW4KPiBwb3MgPSBkcmFpbi5uZXh0OyAg
ICAgIChtYXkgYmUgWCBvciBuZWlnaGJvciB1c2luZyBYJ3Mgc3RhbGUgbmV4dCkKPiBsaXN0X2Rl
bF9pbml0KHBvcyk7ICAgIHJlYWRzIFgtPm5leHQvcHJldiBub3cgcG9pbnRpbmcgaW50byBvdGhl
cl9oZWFkLAo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBj
b3JydXB0cyBvdGhlcl9oZWFkJ3MgbGlzdCBhbmQvb3IgZHJhaW4KCgpLYWl0YW8sIHRoaXMgc2Nl
bmFyaW8gc2VlbSBwbGF1c2libGUsIGNvdWxkIHlvdSBwbGVhc2UgY29tbWVudCBvbiBpdD8KClsu
Li5dCg==

