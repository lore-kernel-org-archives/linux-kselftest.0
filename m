Received: from mail-lr2-f33.google.com (mail-lr2-f33.google.com [74.125.230.97])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 512DB3F788D
	for <linux-kselftest@vger.kernel.org>; Thu, 24 Sep 2026 16:35:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.97
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790267754; cv=none; b=HgNQmEJEJaiRhGr+O11dFi4sJsxcea+id4NYBh+xpGMw0Ib7HDEdx5u+c5BEAphAvGUuHj13F7TmmUTk/8IEbZo2yamTRkFNeBwvEJbCVwiz5p6p7Fi9yGdNGNUbLBrsc2iXqpBVAb2SjokiUUbSGnCT5LV6UXMf9JGmmBk7JQk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790267754; c=relaxed/simple;
	bh=h/hXtBX+fOSa7csou+2ldyLRB/lDDehU91pD9bYN77Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Ciaq7luBHWYUsQv5hik+vvCR5KYcIKxqcWnbEmN8k52AgavjFUxKVTbcF83NOG6/vSjIUDGH4LxfzFEcKN/SKkwJISerecMFiq2PEK5sB0j12IyTVk7EJjfTp8AQmf+ANW8wYN0P9fh2vqz2fh+ccBNvoXOSBIkbC2WZ7QsOCug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VaC1iArF; arc=none smtp.client-ip=74.125.230.97
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VaC1iArF"
Received: by mail-lr2-f33.google.com with SMTP id 38308e7fff4ca-3a2ff16c0e6so18585191fa.0
        for <linux-kselftest@vger.kernel.org>; Thu, 24 Sep 2026 09:35:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790267751; x=1790872551; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=h/hXtBX+fOSa7csou+2ldyLRB/lDDehU91pD9bYN77Q=;
        b=VaC1iArFzSlFp3j7U3DL6I/n5dQXEynqO5eYRbrC7sCK0WvrsXWdsHSgS4XibBDTy6
         G236gY/BsxrfFrwK6nbbGHG3D+0dkyNpLd1mVwBjnWgP8qWmw7wP3+W/87L6d66Kl591
         35O8daPO0ghKyKfBVV0a80Kl5WqGqUe8EU5V0cs2mvp1W82BfCvf+QE5KMziprkX3P+j
         qRy/VmwdtkklsOpztk5wuikzgX0mE34L88+j4Mh/u/69EDhUPeNMD2XYjWW61o7g/jCg
         qErunwmcxHH6T7IN5yeNwz+XZ4L5RIkDhPVIU/eLkf/coChdYvAX8MAjmPxF+N/Tr6uE
         Y4HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790267751; x=1790872551;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=h/hXtBX+fOSa7csou+2ldyLRB/lDDehU91pD9bYN77Q=;
        b=IyCC677fXcgCrdFCXwyyFPB+NxnhwNj6bXCDoyAujqOQQ+ApJtIb75FmmWpQqy5lNU
         m9aLiVL1Df5Lw7yis3QdtWSSuOq58tUU8BE+QqiP9cos9zmkAI4GmnJJsIXiC3BHM4YC
         PQvbHTuzYNapIqRyjx1//Y/4GLX0mZHHCYt1kEwDpfKfg07Cm20UAwmBoi47EjYLsGL8
         TDjPMXP9dRKsNBzI4RRqlEQnC5Ll2by5h9d+RwTuJWV/crhAnafXHYVa6Eypg1kp9VUw
         1Lv/dKGc/Tz/XCXsw/OhmsWwQJIzcC64n4aDSYtoFmDf927+nes66PPRQI1C2rtwlUJr
         JeKg==
X-Forwarded-Encrypted: i=1; AKwUvBzO2rQrQ4WoqFbjovwZ1W+Let2CLNdORj/mi/FWwnv9wkl3qqoX+hhQ5/UVelZzP2lVv4McLzQS3+YOHq7c3wg=@vger.kernel.org
X-Gm-Message-State: AFuF++l88C/5vP8bgM2ZxOKo5/czblA2SKUcUDEXj/vMDLyRFqiR2exc
	rVGfUjDwdzSz9NSS3A68/tMyGeF7CJXnBF+8th+GDXp+ADJlXRAfGrf7
X-Gm-Gg: AYBFou1VnAXSLMi4WmeaOhAL02FQ4t7ijAg1MS9FY5X/f9LJER6Sm3SoybNSxyDrXjj
	RN3DpRVtOoAfgUUl3BYLIOw74+LiIphmsshP/hriU+25qYwgGVaDKrDobHQ3/bSOFSDv5kcox1p
	5Q2LqeUoohVMfd8kGwz/QDoTf6AIPxJBXPijUuQ0NaQrBjsibz3Bn0C6eX1AwXCAEAepdIaOYAy
	YrV4KQbKiR4jI9Cjth0VxTnnvXHbAriwKiKM657li2wwQBYxKkrf3Nxezjt6Rto+hPDo9JwEeKw
	ykwIBC389W2Aj5GZeb5L9kWodGg9JuO0XC+Y6ekw2DO2bJTGgeeT05tzrxOaUkhbCVlD/x6SAVt
	uK7Tz3+fjGB1NhUgDFEU0+bql9QDitIwi+mr9kaEIf7rgJwN92p+4/WSTH59jaGm8ZX4bV3NYJ4
	ajTx52zveAmOG8aFIHB+hl9eo7CY3PjuNx9fVBr5SYjMGH8chFQDRoyBfdZ+qoEbz9WMD/I3Pii
	Exhkz0RHX/zn4oH
X-Received: by 2002:a05:651c:154a:b0:3a3:74b7:fc0b with SMTP id 38308e7fff4ca-3a63c30eaf2mr8247881fa.23.1790267750921;
        Thu, 24 Sep 2026 09:35:50 -0700 (PDT)
Received: from localhost.localdomain ([80.66.93.106])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a63c0785c4sm9611801fa.41.2026.09.24.09.35.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 09:35:50 -0700 (PDT)
From: Maxim Skokov <skokovmaksimevg@gmail.com>
To: alexei.starovoitov@gmail.com
Cc: Maxim Skokov <skokovmaksimevg@gmail.com>,
	bpf@vger.kernel.org,
	qmo@kernel.org,
	daniel@iogearbox.net,
	andrii@kernel.org,
	eddyz87@gmail.com,
	memxor@gmail.com,
	martin.lau@linux.dev,
	song@kernel.org,
	yonghong.song@linux.dev,
	jolsa@kernel.org,
	kuba@kernel.org,
	shuah@kernel.org,
	linux-kselftest@vger.kernel.org
Subject: Re: [PATCH bpf-next 1/2] bpftool: Don't report an empty map when key iteration fails
Date: Thu, 24 Sep 2026 19:35:34 +0300
Message-ID: <20260924163536.507053-1-skokovmaksimevg@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <DLNOPVM33JL0.4IW7LA889QQ2@gmail.com>
References: <20260924160732.485650-1-skokovmaksimevg@gmail.com> <20260924160732.485650-2-skokovmaksimevg@gmail.com> <DLNOPVM33JL0.4IW7LA889QQ2@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Thu, Sep 24, 2026 at 04:24 PM Alexei Starovoitov wrote:
> cilium_lb4_reverse_sk is an LRU hash in cilium. It's not sk_storage
> and bpftool dumps it just fine.
> So where did this output come from?

That's cilium_lb4_reverse_sk_v2, a BPF_MAP_TYPE_SK_STORAGE map from an
unmerged Cilium change (cilium/cilium#44767) I was testing, not the
upstream LRU map. Bad example, v2 will use a plain socket storage map.

> That's not a fix. The exit status was non-zero before and it's the
> same after. Drop the Fixes tag.

Will do.

> Local storage and ringbuf return ENOTSUPP.
> Bloom filter and arena return EOPNOTSUPP. Queue and stack return EINVAL.
> None of them can be iterated. The hint is printed for the first two only.

> The subject says "Don't report an empty map", but when the map has BTF
> the elements array is opened before the loop and closed after it,
> so stdout is still "[]". Only the line on stderr is new.

Right on both. In v2 map_dump() asks for the first key before printing
the header or opening the array, and on anything but ENOENT fails with
"can't dump <map type> map: <error>". Nothing goes to stdout then, -j
gives only the error object, and no errno guessing is needed.
