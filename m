Received: from mail-dl1-f41.google.com (mail-dl1-f41.google.com [74.125.82.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16ACD3D75DE
	for <linux-kselftest@vger.kernel.org>; Mon,  9 Mar 2026 15:05:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773068709; cv=pass; b=IU8P9uIgWYNKkTOhe10n4YePZez/CfEa6hSIK1Wonf+ARp8hEY7LwawPjlVF3p6J1zAdp02wCTHtXJEn2/uOPaSk1RKCmK+E9NBN5kowROW76+etCiY7cKZOksCvklpZMvahG+wycDKLvViHmFuNB/445Bv0LxutUXXzKIOHqaA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773068709; c=relaxed/simple;
	bh=h506DdISAW0jZvmzWHOqq1yATIV5e0BG5Ps1k2LXKBM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fR9BgKjltz9t8k4UOET5glneZv9Tl0Vlh3xUvVOdKMRYJIZEle9+OBbRdSBCKlqYsJI3th2UpV0EccFd7DY4oxB9rwpgdqJq4RrI3bbX0wfpiR4AE/rq7x0pIPp0N/jqDw9AJSpMSVKJ4f8cDR27WBT3FNtCWxJhpdXk/CLKYhM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=1OKV2Oo2; arc=pass smtp.client-ip=74.125.82.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="1OKV2Oo2"
Received: by mail-dl1-f41.google.com with SMTP id a92af1059eb24-126ea4e9697so14326c88.1
        for <linux-kselftest@vger.kernel.org>; Mon, 09 Mar 2026 08:05:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773068707; cv=none;
        d=google.com; s=arc-20240605;
        b=dUfnlQwfCAAgElVgrgSSxdOcMLeBbGlB5l9Z3uIYd3Zu8qNNH4CQQiUHuWxBOns5CB
         N9zbiG+Y/dd+e6G6W0kMJQGoCkNOAgbwb4Q1PtDRhOrmDCOpPCRdhLeBhRL9a5L6XRrU
         YjMAV7Bsoh4uuseLvOLBEI56UZUedACqPlg5+QSY3Ylq4nmafxhZk30siSkWLFZtKWWb
         gHSdS/IndnkI3401RUBw1Fpr6QWsmPIuB9JIUoa/1/OdohQm529kb7BSeWCMJQhfsTao
         WQSgfM8AemmIaPBkcBkOKKtPRTlSnKqM38U1ePSH5tr5L1UgvGJVk64qyeLJPKUHlJP+
         cYOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=9VyI22y/VeTZdWcSGQANDYhZXVCP9xDCNVvpAO/VOQQ=;
        fh=YHAzNuRMf4bKi2gGbQ2GeLYs04g63Q1bj8wvO9Oaruc=;
        b=Ydi43zfbwrmrx3LY01uLJroeV7pP2A8/wSVSk1ID++yCrAqt73WvwEAHbVXHwcRmLU
         GoB1+0mG1qTVUTT2d6NIPSxi+oApiHoL7NXnX+x+658ZCZIQHJMnt9dolmawffHTo4mn
         VRtf68oKGCS1jeF/Wjox1zBzcfLmjIzIUctKkdtXNfC2H0UbQrc3ivTggdrKpjXdrMg9
         lkRJrLuO4iNsRNTNRTJeQTnjEd2vWEUgktIzi156WwIaGrG7mzMeaRq0Lf4baT09PZ3q
         EEYejDpg5NjDtMkwJpvjsMZcXSwkmoi3wL0Kh0oXyb8P7n4GCGhv4k9RFoblddJOWBPQ
         BVJg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1773068707; x=1773673507; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9VyI22y/VeTZdWcSGQANDYhZXVCP9xDCNVvpAO/VOQQ=;
        b=1OKV2Oo2ZpvrDiIem7vHcExeAzTgPqeXPaLCENvu5K8kJPozVtYggxkGESq9typnHt
         L4kc+2KJo35EDCSUGcGCEDRFNCRea1Lfk7TwD5cJYwmvGtaSTQ2D/LL92PlhvhgS/ROK
         LvQ5WdPifdcUCV8931cxIotU41yboxSzu8SDGY24oYFf5QyD/S4qQyh0ZKyY3S9RENwJ
         JLV8S9c+Y6p1xPuqUvUBfFaNVjP/0+vo35QJ2GqG1o4QmvwJDpFm2NUfe+mYX3T/16ih
         foMIGYa8iIjQgcr/iQpfxcKWb9ysclIyHYO9UQMDgmcqglkw+ecm0Mm018u/gdjZHwZ8
         FryA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773068707; x=1773673507;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=9VyI22y/VeTZdWcSGQANDYhZXVCP9xDCNVvpAO/VOQQ=;
        b=R5qWr7UAyRP2R9aTxH8nLh6AdWR7eSjYThs/DHGk4qKKqkZ/0YM3/ofh8gqua61ODN
         YvbkqCc5BQU1xkObZ3lTzOOhAWCgYrmrXU/A90RMaqcc5d0jCCzrHOE1E81RkA6uOYZ7
         TZRQB/CoAT32EKY3Hhia/m/oJ0w2jeVsCkDMixnmcGA5DNM8/jzgGfLE5mwHzaPxBSqK
         uuZVQVBp8z99ut4wNT//YqwCFKj/TrDTqRI+UG0uyfVCBm6g+TTkwQ1gqX3p9BL3ZZw8
         xNhINvX/hBlzMfwOcRmZhCMRs6Puj2c3aXxiJDHp78zKMmRC7gZxoUdyFKn03m3gvZJO
         OVvg==
X-Forwarded-Encrypted: i=1; AJvYcCXQHXkBuUVOal4/HGfFYDd8ckxMGwJqSxdyPLmdME4NOzy6rtcEGmM+oGxxF/IoIW3zCrSU9RRhStaLn8kbIZc=@vger.kernel.org
X-Gm-Message-State: AOJu0YzwOCOf8YWYnNFvehfoOoA+G9P0f1SUUo/frGYWr4HSdFwx4k0M
	+60Abdzcn1G68Quod9GVSYFdQntv8qW8S1XGvTEv3YywKPNPQjgIIV6jBeJGvTTc/Xbk4pCDi+h
	cRUbD3DkRHS2d73/51rueGMTnpzscRRm77YoOrxZX
X-Gm-Gg: ATEYQzwkt3cYyKau9jCn3Yd3SikvGhjGfbm3e3GrxAa4vJaf6tFtJSNccgxMOkm+mpg
	eNpYy8y4IIKVKJCPBl3QCBHcTCW+AnuEvh2zEIeXZ0QlMfMOJxiVCqbu1awsdGMv++a38EW/HG4
	v6+onVk7g/EF40KoSVedJT9wd7GnAhr3AnG4OFFAfCviTxveL0fRwLAKxad6LV/3WSQnsIzx/VN
	Mq/NMTD8urIjFKacGkiqtjfMleB3bLnL3WehiScGzw8PWNI8tOmrUT8UdcDQFT/GQkEmKHDXMgA
	umk78bPjx8w7vwC176J2rt9vrUFG4XJ/Hib29BU=
X-Received: by 2002:a05:7022:984:b0:127:9745:c69f with SMTP id
 a92af1059eb24-128cd6c78e4mr326409c88.9.1773068706409; Mon, 09 Mar 2026
 08:05:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1749672978.git.afranji@google.com> <aa7WjPHTUDCgsO-U@google.com>
In-Reply-To: <aa7WjPHTUDCgsO-U@google.com>
From: Vishal Annapurve <vannapurve@google.com>
Date: Mon, 9 Mar 2026 08:04:53 -0700
X-Gm-Features: AaiRm51CMdt3YQzldlYrLNi93jNDQSQgth1QTuEwDfkO5X2hip81D88zpTx2ItQ
Message-ID: <CAGtprH8Ls0vTYo_Fq_Tb8DwU8R2J14oaniAYNBOPb15dyaWOXg@mail.gmail.com>
Subject: Re: [RFC PATCH v2 00/10] Add TDX intra-host migration support
To: Sean Christopherson <seanjc@google.com>
Cc: Ryan Afranji <afranji@google.com>, kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	x86@kernel.org, sagis@google.com, bp@alien8.de, chao.p.peng@linux.intel.com, 
	dave.hansen@linux.intel.com, dmatlack@google.com, erdemaktas@google.com, 
	isaku.yamahata@intel.com, kai.huang@intel.com, mingo@redhat.com, 
	pbonzini@redhat.com, tglx@linutronix.de, zhi.wang.linux@gmail.com, 
	ackerleytng@google.com, andrew.jones@linux.dev, david@redhat.com, 
	hpa@zytor.com, kirill.shutemov@linux.intel.com, 
	linux-kselftest@vger.kernel.org, tabba@google.com, yan.y.zhao@intel.com, 
	rick.p.edgecombe@intel.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 9, 2026 at 7:17=E2=80=AFAM Sean Christopherson <seanjc@google.c=
om> wrote:
>
> On Wed, Jun 11, 2025, Ryan Afranji wrote:
> > Hello,
> >
> > This is RFC v2 for the TDX intra-host migration patch series. It
> > addresses comments in RFC v1 [1] and is rebased onto the latest kvm/nex=
t
> > (v6.16-rc1).
> >
> > This patchset was built on top of the latest TDX selftests [2] and gmem
> > linking [3] RFC patch series.
>
> In case someone is feeling necromantic, don't bother reviewing this serie=
s.  I've
> provided a pile of feedback off-list (I forgot this on-list RFC existed),=
 and the
> next version should be have significant changes.

Thanks Sean for the note. We will soon refresh intrahost migration
support for software-protected VMs and this series. Need to inject
these features at the right place in the queue of guest_memfd and TDX
features already under review.
