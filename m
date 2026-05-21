Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D5F533BBAF
	for <linux-kselftest@vger.kernel.org>; Thu, 21 May 2026 15:16:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.179
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779376576; cv=pass; b=jch5Kn+szKSqZ//gl+C8tZkLuIl7+dtj1Cmk6Kk/GZ97QFRs/lPpTsdNvWc4qIfolh0ss+tFp8LumxZb6hCFP/Q7qhZEeOoLsWGxQSr1yBOEBnX2PuoUBa74V2goVg716hcZdBeHgL6BAubqKkBE6EjtpOOelg1TuCCRSUxpPXI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779376576; c=relaxed/simple;
	bh=J01o1RM4DhFoqzfk/jOeARRHWP65H1t/fZlj1q1mraw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=X2s4emYmXqNkijsgjPuk2cT0iDirLSlq1NyAZDmYeuDmRfvwlHXJHENQPrLBDbh8cfAC2bICZuOagYpouztQt1nntw77lR8M6qjpQ2m9TqAotBPKgJPU9kjP6kFY0NwoJ3+bIfG6jLteWAMi81cTWnss4JqTXxFUcL99K5k8590=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=azLFHh4f; arc=pass smtp.client-ip=209.85.160.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="azLFHh4f"
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-50d864c23bdso5421cf.1
        for <linux-kselftest@vger.kernel.org>; Thu, 21 May 2026 08:16:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779376573; cv=none;
        d=google.com; s=arc-20240605;
        b=CVfCON4b3XVUCNPS7GGj2ZcXkwMglRYpeT+kWzrys6YaEjUj3IIfljEHkEjmwFLPms
         InG3ZGfZvPljKS/Xrc8xvt8UFvnulH6jcIVeyz/62QinWjOs5BHuudW6Y25npPRKHoEt
         vWAetsqPQBXq10lb3x7KAm1InC16x9ThRH8qOAU7yYz4yCRIbXSQdO7LHfzRqsN5IhUi
         ts9N3z5fBoJSgyh/yolx/QCYrNWrO1GVeQcIdX3nSkydYqqAG+yBcKYtj2jMRf5X7Xab
         Sq+QmRVUksGIt1t8m3y1EzQg608Sha0iPQFrptcfmC1W2ZLbWiuz2pPY0wEbgFhWIdw6
         xkFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=J01o1RM4DhFoqzfk/jOeARRHWP65H1t/fZlj1q1mraw=;
        fh=r3mYxPL38XORXgJ/6LH7jnj1rhh1LdQAxis1Cws3MX0=;
        b=Xu5ksmwpfQBOaHa+iI++6Fx2slye1IxeBRNoCWo2RQ3vu/Q8I1NlQ0rG0GjmZn/EjV
         KkEGHhme5m9U1QrsS3hVe7E9nadTSJDKn8RFEBM6PxXdMejLX/D5+OnGy7PCFcIEXv52
         KfydVhfW8+yusnk/peYPmP2PyjSRTvloLqF7dohEpcA8aN54byI+uXGdeVJ0t5ZNPptt
         3xJbPGU4rftlDlMP+MBRSYbgDToV4LhnyrKdRTSu6+6UL2n6nI1t/Kph3+PBMTvam9Ho
         ES1exGQoRKtCUxOQw7Th+q87/M6s74gz8nRrLQo9wcPUHY+oVqCTZ7s+PdwVxFDYKPG+
         1ijg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1779376573; x=1779981373; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J01o1RM4DhFoqzfk/jOeARRHWP65H1t/fZlj1q1mraw=;
        b=azLFHh4fWZwSc67JwU1+TLxpYF2u2GY9GVmMsNnPOrDroAsoSS5QXBrcGDAn24QCnW
         0jhnVyc8WgLBAMf0bChlQlFHJuWSb2tnwO1I4ryeKTtY85ts2MgZiIsVR7UyzVnO0ouk
         cPQ6U34S8ealZ4vOJ4qaBz+r+vMjPHfm9PK7DPcWTkpWz3sSlRKVPjLweKlD2N1eEmm4
         uYVxXN6Rm18+OUNJFxAJFqvFQZkseQehYYQ/vO2JK3VSdycl/a4RdDTnyjCO2n6mEGeK
         d1zMRceLJCTHc39QrTo6QNAu7SX+H1sZXrurpZ04d3BIHEPICd+HNeTlTIt4GjV396Io
         sy2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779376573; x=1779981373;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=J01o1RM4DhFoqzfk/jOeARRHWP65H1t/fZlj1q1mraw=;
        b=VNSJF1uUrkTMVwz2stN1Ce8oadsj7xMn3EyiySUDzEHQuWx7/4E7lq6DONPh9HGQ7X
         2hdx2jIMEz4VqemnKqF/zJe/78n7qQXnmhTyg4HrpfQwUElM43+KvOOBvkY0PUgc3GXe
         mV5wPO6aMJyE8Illjs0GSX9o7tq7b39ZKpHa19SNWwhfLT50dP2JIWvVCiUOSZmI+Mcz
         W2mx917E43mxsSNfIFIzLb5JqnSZe92GSsz6NXyFhQqrQCGktOa8dfDnlNGpvdVtl1NO
         PT8k4ATcuAyVVLbfXk0DIyRCJ16zzPoyB3aAYPOiOBg2xdr//rrCcWhadB3loPLU4fVo
         p16w==
X-Forwarded-Encrypted: i=1; AFNElJ9auDqop4Y6lA8nVutv8vtN9mRH7RG+Kd1goXHf45AItvGMWndfZnxRhJBqDHcNOy0b7FVZrxH7C7u7kjh8qyc=@vger.kernel.org
X-Gm-Message-State: AOJu0YykaQcvC77YWgr8kgJcekuOOPzBnXpnoLxuPNwZ0ZySnZxbzQFa
	r2ViAoIks9FKNCBAK9rOOkxDYH6bM589+v7ZPH2wpdHA/PQSOYogXMw1yUxe/jtJoAispekWGm9
	2d7XlnK5eu3pyDG5b7Vvfzjdc2MlkWndc4/tU4I+zdM0ElFD9Q+ixkSiGsuk=
X-Gm-Gg: Acq92OGqvvxq6CNNc+ITKMuoFK9H87H8gaHvvyEhmI1MrY/RfV1PVLzVFEfYjU0d+M7
	krWT1DZHVjhJw5LY1wNB4GaPBjqgf6sDZfyLfw93lLn/VIOB4Aaz/g/treRfa2cAJj16RgNzMTI
	ZQiLekUNCOGUeAu4yPzTPvzzcWKzxRX2BOcng7Y78fWx02TRgBTN3eVP5A60qxpuVggTVHoxdT9
	2/GMsCxgqsh/5hb2SUmDzbb6c5vwdwpA5c52Vkor+bnNzzposIcaksr34Mc2zU+ZeLhzbyCGtdE
	qC0xuuupA1DvMSPG1Ks+ujru5oVrhsh7+uFAk5bv0fymx26/
X-Received: by 2002:a05:622a:8c09:b0:510:fa1:73c5 with SMTP id
 d75a77b69052e-516c549f8a7mr9981991cf.16.1779376572049; Thu, 21 May 2026
 08:16:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260426062718.1238437-1-surenb@google.com> <a27344e1-6f0c-4686-99ac-fc2cfcc5bb06@kernel.org>
 <CAJuCfpG3xZhL94E=yR1KsWs6fVwcdoAECoOaV3UOeB10TXmOeg@mail.gmail.com> <0ce6071b-0c99-4119-9ab4-a2d9c00b99a8@kernel.org>
In-Reply-To: <0ce6071b-0c99-4119-9ab4-a2d9c00b99a8@kernel.org>
From: Suren Baghdasaryan <surenb@google.com>
Date: Thu, 21 May 2026 08:16:01 -0700
X-Gm-Features: AVHnY4LLZAgoRouVjFmHuQ-Myz6Ah8QkFGgjPSrwBF-4h2eNKhs2Piibqid79-A
Message-ID: <CAJuCfpHPs54_hc_U9DCxtv=xikKHJMtqCEDN_4Y5aDqKhoBDnA@mail.gmail.com>
Subject: Re: [PATCH v2 0/3] use vma locks for proc/pid/{smaps|numa_maps} reads
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: akpm@linux-foundation.org, liam@infradead.org, ljs@kernel.org, 
	vbabka@kernel.org, willy@infradead.org, jannh@google.com, paulmck@kernel.org, 
	pfalcato@suse.de, shuah@kernel.org, hsukrut3@gmail.com, 
	richard.weiyang@gmail.com, reddybalavignesh9979@gmail.com, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 13, 2026 at 12:39=E2=80=AFAM David Hildenbrand (Arm)
<david@kernel.org> wrote:
>
> On 5/13/26 05:58, Suren Baghdasaryan wrote:
> > On Tue, May 12, 2026 at 2:28=E2=80=AFAM David Hildenbrand (Arm)
> > <david@kernel.org> wrote:
> >>
> >> On 4/26/26 08:27, Suren Baghdasaryan wrote:
> >>> Use per-vma locks when reading /proc/pid/smaps and /proc/pid/numa_map=
s
> >>> similar to /proc/pid/maps to reduce contention on central mmap_lock. =
One
> >>> major difference between maps and smaps/numa_maps reading is that the
> >>> latter executes page table walk which can't be done under RCU due to =
a
> >>> possibility of sleeping. Therefore we drop RCU read lock before this =
walk
> >>> while keeping the VMA locked. After the walk we retake RCU read lock,
> >>> reset VMA iterator and proceed with the next VMA.
> >>
> >> With many small VMAs, is that overhead noticable?
> >
> > It might be but the point of this patchset (and the previous one that
> > made a similar change for /proc/pid/maps) is to reduce mmap_lock
> > contention, not to speed up the read operation, which is not a
> > performance critical part.
>
> Well, this interface has been around .. forever, so if there is a noticea=
ble
> change in performance it should be called out.

Sorry, I missed your reply. I'll see if I can adopt Paul's test for
/proc/pid/maps [1] for benchmarking smaps but I would expect similar
results as was reported in [2].

[1] https://github.com/paulmckrcu/proc-mmap_sem-test
[2] https://lore.kernel.org/all/20250719182854.3166724-1-surenb@google.com/

>
> > The original problem that Paul McKenney
> > described and which kicked these series of changes is that a
> > low-priority monitoring process reading /proc/pid/{maps|smaps|...} can
> > block a high-priority updates by holding the mmap_lock. You can see
> > details about this problem and the numbers Paul obtained with the
> > previous change in here:
> > https://lore.kernel.org/all/20250719182854.3166724-1-surenb@google.com/
>
> Yes, I know. A problem that has been around ... forever as well :)
>
> --
> Cheers,
>
> David
