Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793606236;
	b=S5HGAQ6EYQUC0o2Fj4cS/ZRh81CcqS0A/eLCygEXWE1fSdrVvwgwdV7o+ViP6znJI98v
	 lV8Kzx1tgOL/aweFzjktTt6G/8zgM6fU9GqCBtOvdiwvBm2pyfqlS/gXlZ0LhZOuJQruR
	 zaJVrhOf2DwFlftQ4GQVn1rAxm3BhiaYvOs8EPwMGGLQR64dbEfT8UrXsaEgkKmLRxUdG
	 CRMLqRfG1h23+eZc8VNoS41fwAd+yjJce+/xH4Dev4hB0yKKi51lZ+sFBaBkRgrsyg+dV
	 YKavBz5CIxn/butIvc6mOjK5gM0ttgHo5v1wol0MI2RtXF2vVD9LRvJTLZY4vtZmRGA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793606236;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Message-ID:Date:MIME-Version:User-Agent:Subject:
	 To:Cc:References:Content-Language:From:Autocrypt:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=NaKmM6OIEfyyBlFX9UTGTP7QFA6hXkgY1EikauLPeRw=;
	b=WzlMhxvEGKpPi6lRSYOTFcy9/7zhuecm/LYoxNhtMojzxBM/YVDjdNFsvWkmZKJV0p96
	 mvYq1N6oA5GghuYI+JpHq7edKAgcQDYrYVe477oU2n80P/8OUFxBFH/AgVKGAfOMzyEfs
	 nbRiE46f45hIPPSEXQsZp/LkqCGDPR4vgS84hXg/rQrz+1gdkKayLi+YPuuKqKcxYBAgg
	 Y7EnsZdf8Wr5ixjlLd3f5xVL/tqj+utdenix8hcOEpurdieyqrv0O1MltiZRltEW3tUPs
	 0+udPI924WBRPieJbW09YgQxjGTyPo7mcQheaXK4pS7+YkfP44mhsqa5kaNvnldC9fA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=GD5wYdDe;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=hBQW04Lr;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16762606A324
	for <linux-kselftest@vger.kernel.org>; Mon,  2 Nov 2026 07:57:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 16762606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=GD5wYdDe;
	dkim=pass (2048-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=hBQW04Lr
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1793606235;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=NaKmM6OIEfyyBlFX9UTGTP7QFA6hXkgY1EikauLPeRw=;
	b=GD5wYdDe7oPVknqLM4s4NbXgFQTAZ7i3xqb/vNUbRlCm2sVSEpeVV3esIKRJM+TqbchLg/
	7aFNMjRfK9YXK7dqOdwLPwYkAfcVJtCVBQWSa+tbAFzZnAHbBa8EkKBZMIZNPQnHNJ1tXw
	2LQsLVLFPk32ghEqP89+Zpk9k5Xtp68=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-342-FLxfIQ_ANU2xSgURJCJelA-1; Mon, 02 Nov 2026 02:57:13 -0500
X-MC-Unique: FLxfIQ_ANU2xSgURJCJelA-1
X-Mimecast-MFC-AGG-ID: FLxfIQ_ANU2xSgURJCJelA_1793606232
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-48af4a0bd0fso1471320f8f.2
        for <linux-kselftest@vger.kernel.org>; Sun, 01 Nov 2026 23:57:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1793606232; x=1794211032; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NaKmM6OIEfyyBlFX9UTGTP7QFA6hXkgY1EikauLPeRw=;
        b=hBQW04LrLhGNX7+/QDaqkpYHSDB7xyL+0aVynKtxCXbBEkCR/p8Z6e65CZFSLcHzUR
         6qBiNJajYkzhqtitF4gsyD08GVCgKxcxvd7n/c8EKUq6HzmoZje69+ETIBK4nJQWXS5v
         T1zsk4ienoYboi3Ypas9nZy9dq/9TS2wBFn1Q69AEECDiB+AJL6Hleyf/C95qFmVuOOE
         DriNmq2H6IpDV3rW49MEGtWxvd7Vl5IWSibZ6HV975Jpiu3wsoAJe/JopQIS+OgyFvNX
         Utjwvbw9bEOZodmu+sxMSqwkeBaLIpPSK+89bd/Pg+6y2n0h+kpE0g8eyVUMUyaxg2AO
         mhbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793606232; x=1794211032;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NaKmM6OIEfyyBlFX9UTGTP7QFA6hXkgY1EikauLPeRw=;
        b=wfAtevIs2GdNkWz6b3OQDwCXuX/CoDNm3pn3Q8vK9bRPtUHwhqQZfc/RQN9ZXZd0DD
         gZUA3pX7j32ECVcuHMp+kWpYDlsYwYc+OCTVbQqL4SV4D05qRhWizC2udlPhi91eF3dJ
         SIVYLNBWViwKdNmlD9VTAjmpsYjk1UJBlA2QZqXv2LncSP6gHpjcnl4MaRy91skAQCmR
         SMt/k97SZk8lja5zHUsBbjTnKx/3EfXAVKXvjWM3O25HIpu5VcV4LEY9B6h/WB19QAkn
         PdVffjIY4aqTHx/rinI88MBjK1ftwitJVU9JhekWjxcdYib7GS4zpY9kJpvLMIi+XfaO
         H2Lw==
X-Forwarded-Encrypted: i=1; AKwUvBw1eeL/3gM4cFr2GmQucSvPNOyiPtMxXxLkuq5Dlw8P6Ieuzlziv6l2ZUU6jgz1HdhbJA87YDx68NR55QbI86I=@vger.kernel.org
X-Gm-Message-State: APuU4Z96bpyJUgZgLpv5pndFiUn2LnSDnnQyK8AO/WC4r97TOCJsm6Jx
	M19eqnoLhJ7x10OjX5Ehxnrp2ZLZjH/7rA6Xb68GzBjiSpjXhmBcf1OAUD6EosBmrcgg47XeYfe
	bFhAaLFhFl7gXdsa17zxjNKDoBIi8Okr5dQrwDrw+I8JEhVEHpyjyb7MhcVf4D0M7lbPCbg==
X-Gm-Gg: AYBFou0OSMMWDVgU0EiNZORfmOIZ6igoaIVsZGEtKIrQ5w8rmCAEk7OT4lBt8m8+9HF
	2BlyOOS76OVl+zqBM8HdHuztvjhfkPJ1R+mY5KIfyXnwaSFBzm1PLnRExtZvriW/MOZ4tHESPIk
	wEvowYyM1q70oyuCuArBEbDx0M06CmFyqPSWBinYX/FdScEB3rT/MjiWNMRxev9zebL16Y8QIQM
	TzVqxpXHBQX4NcvCoYCpOt1LhlrCnPveMp67ANH7Of0GtbVda02+T2haTLlhBBoPpEUKh2whZLC
	kpUJedkC0pDC+GVVH3INMfRQVYgbCPgZ+X9wBRgZFDxMPacNcMkbbOYkw46DZJbMWJkfS5jUYNo
	sE2IcBNasyipMLKWX914Rev8TCInEnCjK5XABFZBoCnmI
X-Received: by 2002:a05:6000:430d:b0:48e:25d7:d276 with SMTP id ffacd0b85a97d-48e6e2c3527mr22212742f8f.2.1793606232557;
        Sun, 01 Nov 2026 23:57:12 -0800 (PST)
X-Received: by 2002:a05:6000:430d:b0:48e:25d7:d276 with SMTP id ffacd0b85a97d-48e6e2c3527mr22211158f8f.2.1793606214582;
        Sun, 01 Nov 2026 23:56:54 -0800 (PST)
Received: from [192.168.0.9] ([47.64.112.102])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b79059sm19049763f8f.30.2026.11.01.23.56.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 01 Nov 2026 23:56:54 -0800 (PST)
Message-ID: <c93dab72-6877-4923-adf5-4382b2118eff@redhat.com>
Date: Mon, 2 Nov 2026 08:56:52 +0100
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
Subject: Re: [arnd-asm-generic:asm-generic 15/15]
 /usr/aarch64-linux-gnu/include/linux/types.h:12: Error: unknown mnemonic
 `typedef' -- `typedef __signed__ __int128 __s128
 __attribute__((aligned(16)))'
To: Arnd Bergmann <arnd@arndb.de>, kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, Linux-Arch <linux-arch@vger.kernel.org>,
 shuah <shuah@kernel.org>, linux-kselftest@vger.kernel.org,
 "Jason A . Donenfeld" <Jason@zx2c4.com>,
 =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
References: <202610291918.kHO0GTDB-lkp@intel.com>
 <9e294bfd-4704-42a5-a704-f301f4afe042@app.fastmail.com>
 <cdf09fa3-e251-4d8d-9f0a-316998df036b@redhat.com>
 <5f898f0f-915c-4aef-a3f9-0118f4539951@app.fastmail.com>
 <33492528-ecd8-444b-a42d-d084857a57cd@app.fastmail.com>
Content-Language: en-US
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <33492528-ecd8-444b-a42d-d084857a57cd@app.fastmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 30/10/2026 22.16, Arnd Bergmann wrote:
> On Fri, Oct 30, 2026, at 19:23, Arnd Bergmann wrote:
> 
>> The idea sounds right, but it doesn't appear to do anything for me,
>> I still get the same output:
>>
>> arnd@studio:~/arm-soc/asm-generic$ make O=../build/tmp/ ARCH=arm64 -C
>> tools/testing/selftests/vDSO/ V=1
> ...
>>
>> It looks like tools/testing/selftests/ is built in the source directory,
>> while the 'make headers_install' installed the headers to the object
>> directory in '../build/tmp/usr/include/'.
>>
>> I have never been able to figure out how kselftest actually wants
>> to handle this.
> 
> 
> Nevermind, I figured out that your fix works when doing
> 'make -C tools/testing/selftests', since tools/testing/selftests/Makefile
> is what sets KHDR_INCLUDES. When I tried to use 'make -C tools/testing/selftests/vDSO'
> the assignment gets skipped, so I got the same error as before.
FWIW, I build single selftests from the top of my build directory like this:

  make kselftest-all TARGETS=vDSO

and to run them:

  make kselftest TARGETS=vDSO

  Thomas

