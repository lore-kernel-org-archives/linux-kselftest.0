Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793339305;
	b=VS+BGxtTHdQ9ENPFenLwmZcF2idqqwIXZpzd3Vb/MP/lc9JVQTANtxDVHT1wPseitoif
	 oB35hg+Qk6b6O/yw/cXUdTnsNyr5nd/6rFa15YODzIVr1iwMRbLJrEgrSy9spxf8XQxLQ
	 cpW+oYyTRF1r+S2+OMkGtVee3WWHoCE7NrawLwJ9T0489ZsrGuFGhUqKTaa5lNfVQGhAa
	 sa71ioUasa9QPh4WQvPBTiOhZBSqhMnEJpF9SmJbgev4zl2ZwWXqMP2zyNtcIZpUCEJlx
	 88NoGf+fQ9tJVokpKEmpShbO5iplvqwss25cT26CuDs3d0lTmFNFwNavFnWzl5YgtOw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793339305;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Message-ID:Date:MIME-Version:User-Agent:Subject:
	 To:Cc:References:Content-Language:From:Autocrypt:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=jk0rm4jvaiDVGk2youcQLM21ekVKsq8blgclz8ObRLc=;
	b=2P9NeZ7fhhkCWZPqeRlh6qh6HcXoviAmT8ZHTFa6xh2jeNa5OaQRatFDzHjyEy9lOppR
	 nU6eWHJRXATRcVp4XgRe26paZ35s+xGzXTH6fGqNAnf36aOZKTt19Yidq40Om++vZ1zLo
	 2LVUfN4xNlUcEk7flLrO0uDl5feAwvGlglIFkKXnLO70E3lEVLH1gRk53xeNoezQ7HVee
	 LfJLwGAV11pZfn6rNne9yT66kdYayz1CsA9hCwZtiW6whuQyzQ6OgXKlHCjEIdkhOsEhd
	 9ZLTUN4xKwv9AtBhd69xlKFnOYCEbN/P/CLbEbOMdp9Zr2K56oKy2D0bWo5Dga+qpjQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=f3RbfGK4;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=KADzmYZ7;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCEED606A31A
	for <linux-kselftest@vger.kernel.org>; Fri, 30 Oct 2026 05:48:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BCEED606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=f3RbfGK4;
	dkim=pass (2048-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=KADzmYZ7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1793339303;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=jk0rm4jvaiDVGk2youcQLM21ekVKsq8blgclz8ObRLc=;
	b=f3RbfGK4ovSZFk5iY2+5oPCbyW6HgYxLSwIIWird5yZMuW+NJO4gd4O+3x+BG+xZ1NF8vs
	Lt4uaXmW4hGfuuziTfyaig8+Ph/xbfLVv5AQwMZ0z+FSLVbjsjLnwZS3IOnqG/MEvWGOTy
	LVc7aRFMvcHmRAAFCf8stVez0UNLuxk=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-79-ZZlFTRv_MsuGf1K9VMBNKw-1; Fri, 30 Oct 2026 01:48:21 -0400
X-MC-Unique: ZZlFTRv_MsuGf1K9VMBNKw-1
X-Mimecast-MFC-AGG-ID: ZZlFTRv_MsuGf1K9VMBNKw_1793339301
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-48e0fc747a7so274598f8f.1
        for <linux-kselftest@vger.kernel.org>; Thu, 29 Oct 2026 22:48:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1793339300; x=1793944100; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jk0rm4jvaiDVGk2youcQLM21ekVKsq8blgclz8ObRLc=;
        b=KADzmYZ7ktK7ZmjSi303THK5Lh8efgG04iQ/f0kPVW5kJINAYeVlP4TZmQcpYNtgZu
         ATkT2q4dzg7SACaTFRKNQSV063REPQWM+tk6PkjUSe4rz+O3iPgRLWI0qkxVwu9hhZ7+
         MNaij1QyajYHmjoD9+ef/gDVYTf9YyUQp0+w+i059qvDiK61HwKPBRz2F5xBBpX9Jl25
         KRfr7cMM72aRRUNZpLHa+BGwV61ITu4dEJQuLdkyPfX/OxT/A8HSNO7Jx+beJvacfDe4
         asCXbx5SLUB1Wb5ddVz4sf1C0q61c7YoZLUMGYesZSFBOLVx61JqueJe01OVRDQFUWKW
         YA7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793339300; x=1793944100;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jk0rm4jvaiDVGk2youcQLM21ekVKsq8blgclz8ObRLc=;
        b=2rB/UBWcFi8JNHdDJ43kZl+opFjYsf8SHp0AqG+TvUc8IukFkBJbB2rX6SSkR5xynC
         CuUHSVBSEoxvnqQIRol6RLmgngzcwFJOuUzDS+FmNsuP3wxnd8gI+5Gmezs/PonM8e8d
         wuwQr7dcWDTLOmvHJaH3WPvfVSk1av8jUudBM2ueq5aOCqQA9SNLjPU0za1Wn/JhegVg
         jlTQipeOzYDLVgLVBQiRUdMc2duM8Kv2vDrgRfyCR2WxDuFGOFiKjqjEmH0L6DcdHvRf
         4YHRIOcLiGqQ0IFKo7xnJdmHH7e0g/PqKzmqetwpcRn8fv4qfrGbgwQhfaXixHH/M97J
         f+3w==
X-Forwarded-Encrypted: i=1; AKwUvBwHjrE1jBjM4vHF+gleEGZ3hP6QoEbua6gvQl5g6Tmce2O+S88WpEcaHe+ear9n7u7cDoV4/90TxXbofoE7rrE=@vger.kernel.org
X-Gm-Message-State: AFq9FYKoHy+x/DUQtPBJKz5n2m6o9wT5WRtl8quHDrawhjQZYeGhHsFT
	QT96OhPFkMNcKJgR0gfk8fXI7LH0tJtnabUGjvTlWGusoxlSEnWEPko3dPQNOYLnLCVwNH68+SL
	b9VOtZ2QOG8JX34/uhPTYJtvamGYhLN+5Xm/3YtxXaUw+O9xlskyKuyJ16otJZttnhfkTFQ==
X-Gm-Gg: AYBFou1elWTsn0x//dwJnHxbUAJZ+f/g5Ng8j4YUYjYA7ZQhMQ69zmMrEmsCWA7Ur15
	qpJD/L2CiTxObiNd6c5SnbfcM79jApZsy4bGRln0WlJijgkeeD7U7rk4rJiO4Ppj8W6wfzOezH8
	q8lD97ck2+2r3ba0G/E6J207+tu+mWtq6lI7dJfuttCoKdwOa7FFltJc5C/mVcuCH/miSzaiTG5
	bI+fNcIcdQpeCDz1YD38DOPWMur74MoqtoqmUYXNtGRc8xgG2mk+wKkhqbUi1oNKv5GSTO1KoYM
	BDhD98dwyvMrC+JaKhVF4Bpp8zzjn9h0FGXdm9Few9b3YCQMDl5tj+a2uY9/wvWPasxspYEaBua
	Y5eVKOAA1bxh+P6Eny9gUXFh1aRVpCsxEvO1Rzo1jHKAE6OQ=
X-Received: by 2002:a05:600c:354a:b0:4a3:5aee:2c25 with SMTP id 5b1f17b1804b1-4ac181e759dmr23905775e9.31.1793339300599;
        Thu, 29 Oct 2026 22:48:20 -0700 (PDT)
X-Received: by 2002:a05:600c:354a:b0:4a3:5aee:2c25 with SMTP id 5b1f17b1804b1-4ac181e759dmr23905515e9.31.1793339300195;
        Thu, 29 Oct 2026 22:48:20 -0700 (PDT)
Received: from [192.168.0.9] ([47.64.112.102])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71a4d5dfsm1501346f8f.3.2026.10.29.22.48.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Oct 2026 22:48:19 -0700 (PDT)
Message-ID: <0a5de4d5-8b02-40f3-8067-f75b9f1020eb@redhat.com>
Date: Fri, 30 Oct 2026 06:48:17 +0100
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
 Shuah Khan <shuah@kernel.org>, linux-kselftest@vger.kernel.org,
 "Jason A. Donenfeld" <Jason@zx2c4.com>,
 =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
References: <202610291918.kHO0GTDB-lkp@intel.com>
 <9e294bfd-4704-42a5-a704-f301f4afe042@app.fastmail.com>
Content-Language: en-US
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <9e294bfd-4704-42a5-a704-f301f4afe042@app.fastmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 29/10/2026 23.13, Arnd Bergmann wrote:
> On Thu, Oct 29, 2026, at 19:09, kernel test robot wrote:
>> tree:
>> https://git.kernel.org/pub/scm/linux/kernel/git/arnd/asm-generic.git
>> asm-generic
>> head:   dd7cc8c26b6a37a54adc5ce38d286521b7201044
>> commit: dd7cc8c26b6a37a54adc5ce38d286521b7201044 [15/15] treewide: Stop
>> defining __ASSEMBLY__ for assembler files
> 
> Hi Thomas,
> 
>> config: arm64-allnoconfig-bpf
>> (https://download.01.org/0day-ci/archive/20261029/202610291918.kHO0GTDB-lkp@intel.com/config)
>> compiler: aarch64-linux-gnu-gcc (Debian 14.2.0-19) 14.2.0
>> reproduce (this is a W=1 build):
>> (https://download.01.org/0day-ci/archive/20261029/202610291918.kHO0GTDB-lkp@intel.com/reproduce)
>>
>> If you fix the issue in a separate patch/commit (i.e. not just a new
>> version of
>> the same patch/commit), kindly add following tags
>> | Reported-by: kernel test robot <lkp@intel.com>
>> | Closes:
>> https://lore.kernel.org/oe-kbuild-all/202610291918.kHO0GTDB-lkp@intel.com/
>>
>> Note: the arnd-asm-generic/asm-generic HEAD
>> dd7cc8c26b6a37a54adc5ce38d286521b7201044 builds fine.
>>        It only hurts bisectability.
>>
>> All errors (new ones prefixed by >>):
>>
>>     /usr/aarch64-linux-gnu/include/asm-generic/int-ll64.h: Assembler messages:
>>>> /usr/aarch64-linux-gnu/include/asm-generic/int-ll64.h:20: Error: unknown mnemonic `typedef' -- `typedef __signed__ char __s8'
>>>> /usr/aarch64-linux-gnu/include/asm-generic/int-ll64.h:21: Error: unknown mnemonic `typedef' -- `typedef unsigned char __u8'
> 
> 
>  From what I can tell, this happens after your last patch when cross-compiling
> kselftest against system headers that still check for __ASSEMBLY__ instead of
> __ASSEMBLER__.
D'oh! Could you please drop that last patch for now 'til I figured out a 
solution for that mess...?

  Thanks,
   Thomas

