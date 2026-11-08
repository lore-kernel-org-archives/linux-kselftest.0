Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.176
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794165255;
	b=QBK1WeGUaYLVh5rZejYpI0ess5CQVUP546riRAgnyBsQpVfHXf+z9+OrOSN/EdWti0bc
	 7kuOyj/0QBmwL5zUTDTuj4H5leLllmqE/QG6faHKi119WnMV0dmAR2ZFvj+Et9a/lQaGk
	 szsptmJ7kuhYlDQKSCwwxtC0P32Cskt2Pmz5wBygyNQDyOJwGap1iUFPelS3fM7cWzz19
	 LpJ9a6jUhBBek0p9QIAaTV/ZG2XB1iiBzSKmvMzp09Mh8pp/WGSWDHSTHqK/vs83k8IC8
	 Ih2u6ssZGzHdCv6+zislD8IfFq9sn6TgFlyy0Iv9mh8y26rmwdopWDEI1EUXzO5iEQQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794165255;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=Aigj0AbyH3j86dbZXjOqGutzBLlzhmdni5njhtK+RHk=;
	b=BCeG3clmvTs3QZUt/Tr7Pm2PyBxDiEaCvIV+gpXFyAznqTgfPmwZ5uMny4ihiJOoyxvi
	 ttQd5xEzx4Ca3aHSxZiONafBMV7T66wBmBRvebQgTxpvP+Y85YfbN8i2MyknOq3IKdoc1
	 Yjv/Sw4RAk0GR/soIGIhnWjmfc6CTcpgWBbkwY/kc8kkBNFDoyM2r9yxh/nWdrHStZn98
	 Dr6HTeZ7HPx4FUcRzYiE7phOHyxgdiFWPvAYl4etKKxOc3+iBlPUi6CQSpQ1jGHWL+UfG
	 w2LDY4YTks5wwFrV0Au0NSNpQQ1S4Wq2G1OmxAQulXgYaSeBTvBcW6c+gA3dDaOWl1g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rllbRpEg;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.176
Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46EAC606A320
	for <linux-kselftest@vger.kernel.org>; Sun,  8 Nov 2026 19:14:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 46EAC606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rllbRpEg
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-33fb4680717so574045eec.1
        for <linux-kselftest@vger.kernel.org>; Sun, 08 Nov 2026 11:14:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794165254; cv=none;
        d=google.com; s=arc-20260327;
        b=KFcFypBV+a+oe2mMxVIRpu3NEKxbelLnXdcwetQGLL4RjbTPZnYu67YS3n9HeFz4jh
         jGwnFr/+kypieYI0H56IlVy99TG4pyZ1W02ibeo+GLGvegGmgxEGS6FpoydppU3mPPcD
         kuzdOczggaX/Z6mkBJNL+4Y7RUh7j0EZqWu9Bw9D0nlFcf60baFUcKZI3aIyH0pIbV1W
         LwS1DvytlZoprnARQDLXTGBCdHVjJl0cgC0oPQbxxXfjOpDIy7w+TCvmkb87PJzrTieO
         JPHFa3A6xTBZE4FzUkjkDZucQFbXnjgmLNtRvCug8nMcmlq6dRiPNqsaJeRpaNYRs65o
         lCtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Aigj0AbyH3j86dbZXjOqGutzBLlzhmdni5njhtK+RHk=;
        fh=D/2qTpPu9MOIUYCRrX/AvGdXM2frv4No8ACI6KVnq9o=;
        b=dd1BFuiQwP2iho/pdYhnRGzXqhZBuFWK14CAPL0QghS/qRINC/DluS8Tn/7Ym4nes/
         8tYqS2kVifA0qyIwv0EzMBQuczUoSsnw1LGo14awOtsx38zIh/RtzbGq3L7xpJSbguXp
         CXOjw/mfIzXlO0RIRrBxBn7flPSrytEADkcW+yN7AuZ7FVHo+Ce6THr40bm+qlISxhxo
         8eeeRF6T7JEVmMHaRgGd3e+Ka54+nNA2wb9vE+LednbbOjzU4xgBYEOQOAIkJZ5m1eFR
         PkyikCq0QOiQi2eYeYf19mKDm3Ua+zV2lJWAAbYGgSZSd5nWzCCe4XFVTQygnRx1991v
         OYfw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794165254; x=1794770054; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Aigj0AbyH3j86dbZXjOqGutzBLlzhmdni5njhtK+RHk=;
        b=rllbRpEgiw5AIuoQnqAOapTJtURQPajg1YXAwpRhZlWjt7K+ZzeDGOMzFSAzbSqle8
         RZSht2rfco69yYb8DEwj2en5KGT41k/56aT8gFqQnYZbnRoU0I4+FoIQPMMpYyMQr1tR
         uhD/S0OsBEBHi1wcCfsbCoe2fmWPlMGpvlttpmmuONqFrunvkEbxIVNU548gxCpkJp/H
         Cp3e/CrOl9QoehwxzPoS8HzOv1MqoWlgKxSSr1+7axyaM2JhbW82FxzdcAhYpfeuaWsq
         Fr2lWuGq1Mqt6zthCm79fbucEi+tySKeWtrJ+OpVVr7ZEFfBUNeHjQm/YgJYmfsTksLV
         2cOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794165254; x=1794770054;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Aigj0AbyH3j86dbZXjOqGutzBLlzhmdni5njhtK+RHk=;
        b=z1hr/7anKIrQYBl+dvGekDn3YpRR34BpYPRPfZPqJiWVT/y8PaZeqTb2hJbZmbE+CS
         iIrKsGPJBRVg+MqVModYO0OPxJmnk3AqIov8ppS+8rFKMeSnJ82BmkAMPohJwXoiSHwJ
         xJDs22GnLY03SIe+yUnjdoQ2iZLHeER3+7g4vnVpZ7z+wJO+HNrUzRKnWI25Ia6HVq4b
         jFoNGmqqBBAMXPUQNUzdHBxftDVAWgEMB4kG7irkWLK3QSPFO+RG567ucylgHNGDuwG3
         0T+/qOQJfiFMU7NGn+x9Z0DiX3p+Aw0QhPFH2o3NZTvQV4u7XaI/yVVRc1V1BKIDHOIH
         VKlw==
X-Forwarded-Encrypted: i=1; AL+hErGME67FcRIeaDXQ5JE4yZpgYTx2R18LrWTxNdzk5YhDO6vzrqtk7TdqzoNllEqajQBm6VGaA7lMvMn9RAF42Jk=@vger.kernel.org
X-Gm-Message-State: APuU4Z9CwJjYbAyZCTSpeRuBawg8ooUKSIypYdJHCU/qWgDWeNT5KMam
	0GACqxOZlyKv9c9LMJP320FsS4Uhg5IxlkYuXH3sXAQhYIYq6/CCBjaHVE7b0/2jtHcQ17GdSMO
	x19YVXQnn4X3Bcan8lWE1+/oQVFpjlTU=
X-Gm-Gg: AYBFou1Y3aHdyhqxIrmUD05gP/VIOdPKCdVXIxzmHLfoxZWJ4swTVCvVys+nFdygf42
	FWNxC2XPWFGAjpmeSqzkPddZuxZFQiHbh5uqfY3WYtByTqnT8NSYzTD4ZivGjmbyW5/wzcSGR/g
	IJf14/AR4MXlZCKHArMMJrOZ64V3dibDbx0E25DoCIK1vPQ9yiVhDXWyUYBTO5xvevKL7X4rR18
	X3EK7LVeRk0i/7TCqaDCG+wrq5mA3yhzR/WDHA5tuYYijC05RTNkjdFbW5uo8UP0K0Z/S3MgJ5h
	Tvn06YLDEBt4rTZCJbPlyhAYSOsg31BxDnABWIXBkLAyQao0AXitGCeBJwl/MDxgq8d7dbAVkUI
	5vGqmSChDmy58sq5HFf6RrEn9AlBnifrZjccAiAj7aNj9yDOLzprLT6RRd8eCDpMKflKo4rw/91
	0nWTjbEykQgOQd9lX6j5UaYtQ7J0sLpP5uqX9Bs+paJ/FmRgzVl5GIiBigunLl/EZq7cxfAkreJ
	dzypIY=
X-Received: by 2002:a05:7301:7004:b0:372:eab:d700 with SMTP id
 5a478bee46e88-37252e3a967mr4833895eec.1.1794165254303; Sun, 08 Nov 2026
 11:14:14 -0800 (PST)
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261029-rust_kunit_v6_send-v2-0-5ce551efc48e@gmail.com> <20261029-rust_kunit_v6_send-v2-3-5ce551efc48e@gmail.com>
In-Reply-To: <20261029-rust_kunit_v6_send-v2-3-5ce551efc48e@gmail.com>
From: Burak Emir <burak.emir@gmail.com>
Date: Sun, 8 Nov 2026 20:14:02 +0100
X-Gm-Features: AclHuK8Zqm3SYvO-6lPeY5_gCtAhcGYV6kboEDJv7680m_CzRJR-fiUMmy4_9do
Message-ID: <CABwQupNhiTRmbA+1Ps96tAe_vrUehAR=ZqmPustz8M4k47X6vA@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] rust: bitmap: kunit: uncomment owned_bitmap_out_of_bounds
 panic case
To: nico.antinori.7@gmail.com
Cc: Alice Ryhl <aliceryhl@google.com>, Benno Lossin <lossin@kernel.org>, 
	Boqun Feng <boqun@kernel.org>, Brendan Higgins <brendan.higgins@linux.dev>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Danilo Krummrich <dakr@kernel.org>, 
	David Gow <david@davidgow.net>, Gary Guo <gary@garyguo.net>, Miguel Ojeda <ojeda@kernel.org>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	Alexandre Courbot <acourbot@nvidia.com>, Andreas Hindborg <a.hindborg@kernel.org>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Rae Moar <raemoar63@gmail.com>, Tamir Duberstein <tamird@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Yury Norov <yury.norov@gmail.com>, kunit-dev@googlegroups.com, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 29, 2026 at 5:59=E2=80=AFPM Nicol=C3=A1s Antinori via B4 Relay
<devnull+nico.antinori.7.gmail.com@kernel.org> wrote:
>
> From: Nicol=C3=A1s Antinori <nico.antinori.7@gmail.com>
>
> Rust KUnit tests now support `#[should_panic]` attribute. Uncomment the
> test so it can be run when CONFIG_RUST_BITMAP_HARDENED=3Dy.
>
> Signed-off-by: Nicol=C3=A1s Antinori <nico.antinori.7@gmail.com>
Reviewed-by: Burak Emir <burak.emir@gmail.com>

Thank you for implementing this TODO, Nicolas!
Testing panic behavior is useful, not just for ensuring that it meets
the specification but also ensuring that changes preserve the
behavior.

cheers,
Burak
