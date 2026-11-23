Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795458406;
	b=aE6RYFElXMumdv5qaPGzgje4P/0+Fn0RoWv0HQ2gFRXa1GaGEW6rrPsbftdlITukp3EG
	 LNJWbyllaEg1yqkgxBiuo1ku/PMNNZaYf09Kf3EBKzuyA6eTEX+X3x7T7coj7Nd4ES9eV
	 BmuXXZRUSiZZv+WHAX2kCRm+OLwlYkLVeEARPJ635bwxOgX72I+gqHFs8yaCrZf4obhCO
	 HV1E3RAcgY0zlBisutU6sMDQTMr8V0m7rUl2sIuvkHmycbVdo+4iFHa4vNpL0ZgckW6Xs
	 YhpYlStVNP8roaB90D+lDMqkcXjz/mOaHDWjGwmMP9wXXSNakHQVX9etGCdADjSU3Dw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795458406;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Mime-Version:Content-Transfer-Encoding:Content-Type:Date:Message-Id:
	 Cc:Subject:From:To:X-Mailer:References:In-Reply-To;
	bh=thHuqHmooBy0uGsMcFJyj79jvgcNxfQof3z9Kg8ZrOQ=;
	b=N9pvvne6bKbPVL+bRgI/maFGlPU3/MT9UrJKxlrV/NcY8b+gbi8oX4HyqU+BLvHHj5t2
	 Ni+FKhTXt7UBub218+xexerFkGlmUzfBKVaI2klZ/zl3JNB8DG734MqNBSGtkBzac3Ui4
	 Ttajcd+FLkknOVBTyzOXmZvs2TaxbznFWOObWNZAKwh50Et0439yyPldSYt8ZyQi+C2Z6
	 QWLDxZAxnmOoXSJami1PTAWF83qntoYLFS1HiZf5PVvujX0CX7BZdrrR94jYy61bWOMge
	 xV76LULMNpchsftN/rJr8bbXoQwFG6i4KMu5N/LVv9RagMnC14AYj86PAbXZAsFXsYg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=A3CgtlLr;
	arc=none smtp.remote-ip=209.85.214.176
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46C9A606A31F
	for <linux-kselftest@vger.kernel.org>; Mon, 23 Nov 2026 18:26:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 46C9A606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=A3CgtlLr
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2f05bc71e01so14309005ad.0
        for <linux-kselftest@vger.kernel.org>; Mon, 23 Nov 2026 10:26:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795458405; x=1796063205; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=thHuqHmooBy0uGsMcFJyj79jvgcNxfQof3z9Kg8ZrOQ=;
        b=A3CgtlLrKMI/0wVqoxsYUWu7YEQMcNCo/SoU3XWimCZPRdYmKz6jWB6VbK0N6DGBBM
         MW7LmbyTpBgl2XThw5/fstI6W2Rv8yxc8XG6zYPxg8ZUYNgt7MS7vAQllENT/gWjOUBc
         NUkjtO73p0y06ZchiOAZBKAR0NmkPfAZ6BoVw3kxcoF87eYmiV6YGN66uIH8j6wfugKg
         0wyCXn4iAws+ZGfFmw0hBfPhM+9JsHWjG06N/zgoRM0KEilK/p8WhkB05sKl9EAl2foW
         SywtFBvUlcMwn3rMobIEFlmuLLCTcKNE8Ny1fFBkV6/ZuuPqunA9lD9YpmKegCnNI+19
         A6Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795458405; x=1796063205;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=thHuqHmooBy0uGsMcFJyj79jvgcNxfQof3z9Kg8ZrOQ=;
        b=Hu4JH8bNOGJgdi2RkzE8h7fihDiLpvY85/RHYj80rnAyFdeVzoQGd/kQ78p11K0j9p
         7JcH4I5AHe0ExEhEvPA8qlARZNq1uyzfCMJ//FMJE+5DR3S1v1rjmFu4bRpy2W4uJaWw
         MrwY36JMU0EONTfjmNTB3lsOyyJTeyDtAjTeUVtLqCfdWSyPJ1rvVxy6+1AmUP8T6Had
         3+5kOsTrewurvifUajaFQD7v9osqlaNWJ5PazMl8udFRSL7wxvUhKL7xKcOQo0cfX8wW
         O+ht4yT1cP/GA1nJagJU3N9OE52NMF4IOV+2AC0q791TzBR7mIcjDMJSQFHbDI86PvXe
         E8dA==
X-Forwarded-Encrypted: i=1; AL+hErEnnl9jwIRa+I3KCZsOHVnmeHXx4lDs0OcIe/jAGpUvWJcQ5k9aQWLIIiIc9hQNykpPZ0TvzLdJVUioFlR8Aa0=@vger.kernel.org
X-Gm-Message-State: APuU4Z/PLV9Xw6oKNaLXuDjmCnayM2+oe4LK4HvoHmr24gdXcKk9N9dh
	Rfc7vtkQk7JybbYS1TwVbwpTvrc2h0CegMD37s4pskMLNOOmDabzp5YDbRgvGdDogw==
X-Gm-Gg: AZFdTZdXa8y8GzpwJdoFSkTFLuVJm7zReHfSLGhZIXeVXFCDtWdz4msEgNp7mWiHQhC
	gop+4Myka/YopzhGPSjGsGDfMh47Xnp12geLfj75FRA91vE+Y6k3sDNYB1ITguwy8W78rFJYsvs
	voi+NPd0ahIkFFfCEqDJKVBRBl+C5Zt43J/Gs2eiPREUSY+1ArhKnlJsyGucCM40rCRySy56B9P
	wvHMY+as+OBzHmqhwAIqDuRvgsphBDOn8D0jiDBuA5tA9H8kc9MfXi01b/PmfpbW8tqMtCRfJm5
	eUrgiGFcrFAyRojPG/Q+q+X4K3cphzTpT6OVR+unE7YbC7aaPDQ4RrIh3U3B8m8gI3TU3BAMixu
	qARlJX9jpd4UvCEmDw5FFyQW/0VvCpKC6QrVUll5BpO0XyhtccuHI2OzIshNY0WMUEmZJpx5eWY
	KK81YqN3BqZ54BV7jOn9sxpdjLePxFdldyZIfdnmjfIFfgTkjCCl2AcbXaDKkjFPV93kA9pjxLH
	P03XvcSpOxHCFnA0FTyvx3pkEn4UWb8GFpD72/P2nNpbAjJObWV9R4fQLYU6rumlE9T+jGfgKAO
	xwwdHvVB58EVO4MuES2Wb7oxLHkBce35zKkILNA6OhV0VHQO+khW2ZVAqk3+o8CNlQ==
X-Received: by 2002:a17:902:d542:b0:2e9:6790:212c with SMTP id d9443c01a7336-2f03f190776mr120496345ad.30.1795458405057;
        Mon, 23 Nov 2026 10:26:45 -0800 (PST)
Received: from localhost (33.79.127.34.bc.googleusercontent.com. [34.127.79.33])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03f120282sm56755105ad.59.2026.11.23.10.26.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Nov 2026 10:26:44 -0800 (PST)
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 23 Nov 2026 10:26:43 -0800
Message-Id: <DN2SVVWX66U1.37JRVKARDRNYN@google.com>
Cc: <kexec@lists.infradead.org>, <linux-doc@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-kselftest@vger.kernel.org>,
 <linux-mm@kvack.org>, "Alexander Graf" <graf@amazon.com>, "Andrew Morton"
 <akpm@linux-foundation.org>, "Baolin Wang" <baolin.wang@linux.alibaba.com>,
 "Christian Brauner" <brauner@kernel.org>, "David Hildenbrand"
 <david@kernel.org>, "Hugh Dickins" <hughd@google.com>, "Jonathan Corbet"
 <corbet@lwn.net>, "Liam R. Howlett" <liam@infradead.org>, "Lorenzo Stoakes"
 <ljs@kernel.org>, "Michal Hocko" <mhocko@suse.com>, "Mike Rapoport"
 <rppt@kernel.org>, "Pasha Tatashin" <pasha.tatashin@soleen.com>, "Randy
 Dunlap" <rdunlap@infradead.org>, "Samiullah Khawaja" <skhawaja@google.com>,
 "Shuah Khan" <skhan@linuxfoundation.org>, "Suren Baghdasaryan"
 <surenb@google.com>, "Vlastimil Babka" <vbabka@kernel.org>
Subject: Re: [PATCH v4 14/19] selftests/liveupdate: Test which tmpfs files
 can be preserved
From: "David Matlack" <dmatlack@google.com>
To: "Pratyush Yadav" <pratyush@kernel.org>, "David Matlack"
 <dmatlack@google.com>
X-Mailer: aerc 0.21.0
References: <20261111002358.1842967-1-dmatlack@google.com>
 <20261111002358.1842967-15-dmatlack@google.com>
 <2vxzh5hb1sqo.fsf@kernel.org>
In-Reply-To: <2vxzh5hb1sqo.fsf@kernel.org>

On Fri Nov 20, 2026 at 6:29 AM PST, Pratyush Yadav wrote:
> On Wed, Nov 11 2026, David Matlack wrote:
[...]
>> +TEST_F(preserve_tmpfs, frozen_size)
>
> Nit: This test isn't really for "frozen size", it makes sure a preserved
> file behaves as we expect it to. So perhaps call it "preserved_ops" and
> update the comment?

Will do.

>> +	EXPECT_EQ(ftruncate(fd, page_size), -1);
>> +	EXPECT_EQ(errno, EPERM);
>> +	EXPECT_EQ(ftruncate(fd, 4 * page_size), -1);
>> +	EXPECT_EQ(errno, EPERM);
>> +	EXPECT_EQ(fallocate(fd, 0, 0, 4 * page_size), -1);
>> +	EXPECT_EQ(errno, EPERM);
>> +	EXPECT_EQ(fallocate(fd, FALLOC_FL_PUNCH_HOLE | FALLOC_FL_KEEP_SIZE, 0,
>> +			    page_size), -1);
>> +	EXPECT_EQ(errno, EPERM);
>> +	EXPECT_EQ(pwrite(fd, "x", 1, 2 * page_size), -1);
>> +	EXPECT_EQ(errno, EPERM);
>
> Nit: Is there any point in matching the exact error code? Wouldn't
> checking for a failed syscall be enough?

The documentation that patch 11 adds to shmem_luo.c says these fail
with -EPERM, so I'd like the test to check that. But you have a point
for the other tests in this patch: the documentation only states the
permission rules for preserving a file, not the error codes, so in v5
those tests will just check that preserving fails.
