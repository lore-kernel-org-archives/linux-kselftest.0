Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00F9A39021B
	for <linux-kselftest@vger.kernel.org>; Wed, 13 May 2026 03:58:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778644721; cv=pass; b=sdE7nM/z4BpqRSOnY+yzk7xeMC/TeTOhMx2Z+6lsjvvHsl1ShmXwGRYVJYlbGTlul0+i/55hj3QDhgAd9aWvda9KWr2ADwYSxEvJhT5jRgUI9yMy0VCfpWm1+r7QRLBkM0hC7M1zNQnMri2mlSn90DDfK9cy0Cn7yseUa0778G8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778644721; c=relaxed/simple;
	bh=40b0mj9LccqvykOYFJDhNVL9/cfh3wCIRjlfxH+VtLQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rf8cl5jz0VZqwe2/NOnjFky+lEXge4hIqf9eaxrjbsEJZK/qxMrPHQjrXyifpqqQVynN12YM7yEXgUjYfCJaSCrD/zvrFhN/y3jnHN1SoATiH0Vhb81l4zXCsQO/kU+e/7HPa05AscnKKgtqxS/XSaOvDRgt+aS/NM3caOrCrrA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=RhKG9E82; arc=pass smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="RhKG9E82"
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-671f1a0d0c5so88a12.0
        for <linux-kselftest@vger.kernel.org>; Tue, 12 May 2026 20:58:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778644718; cv=none;
        d=google.com; s=arc-20240605;
        b=h6GWe/w+0ZmYdcQMdroSFt2jIBiDymmeFgZcSRwHcy/7bEz+m5nyYv5qQUfr629gOU
         vH9Z5nD5fd8ySYmQQCsfSb8qYwv7dR/NIjWSwKIyyNzC8WapZwqqDMFBptnGfbCFP5vt
         4u/oxXqOtFp75mtnZtV+AY3NbRN8qdGGMUZ55FjT/1gQ9OC7wEkSJPvWZtNXmzeQYR/T
         YWJi59NpUXe1Xlr6453tq2wnqJ+rcSK4DAxgLEtbXVB1QOXGu35Rs/PW9tb76T2hVYH3
         KRhjIgm6rAWKFyHOYWSebXuEktxXTl31Y3QndNbaNmI9PB5auXhihhh6neR4ptkdN6Cr
         eGbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=40b0mj9LccqvykOYFJDhNVL9/cfh3wCIRjlfxH+VtLQ=;
        fh=VU6c15fpcVLotTMgps6RIimiKQVgC6WMWjPNaTLWeFY=;
        b=ApzG0OK9Glr/H6qpxPWvuggNZQ35XnrWj/QqXQ8aHtsRNHBhGiGopLFTRDKXkuIOpx
         /Nncs8NcHUNb+F2m0JcgcIwiIaangv5V5BjakYZYDEBAFPeZWpP9t4JhFv8cCA/NJQjG
         eYBhQ8t9RZrhdEbcDyiZrlx75QedkjY1F9diwN4X9sBKXRNERvdMSH5kOnyI1AqHPZ+/
         22IDZka+BMaGUSXVDE071b+Mbq4rAsC6ToNL1aLDRMh0WYnFufk3Ijm8qk6qxXLND2D1
         2sDCrJrxASIUVsPwzZ0K3myVfjfdMHDEmMKVAPnPUlJ9QEnmquilBniqvZW73aC8VPAP
         VsKQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1778644718; x=1779249518; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=40b0mj9LccqvykOYFJDhNVL9/cfh3wCIRjlfxH+VtLQ=;
        b=RhKG9E826BMslqvMYNZZoYjgM5RAdS51NGBUgDWbrOiFYAjvnV5337BQftnqXJ2c23
         tSoc71oYJsGOfI8TJUdGxradUDVhPxEU8WgAP9y4OHKDxrRxqk87+uheOJ/lKA6DofKW
         z6teDznnZqJ7VPsXCQAVkmVHMQlJsRwVsgJWucRVvloSs+YbTrN9iuhk6HDbkRkDRVGw
         oZCw+KpFyQkN99zthKVVP0bJiu8aMTX4wAyoumJpTqFqsWTHpubhBGYPV8hGDYzb+DTd
         khdjMtk+p1yO6CWBnSdrmtrn7s+VA3NR0/RkdXkEY18ByXlyWeIDikhB/ieCrfhqlJNF
         vTQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778644718; x=1779249518;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=40b0mj9LccqvykOYFJDhNVL9/cfh3wCIRjlfxH+VtLQ=;
        b=QwjhhK/Tm01j/DVE6ooUUk4ESjbAMxpHWH6Oq2LIvp5s8EqBS3T72ainBQhFrdrGlK
         dZnzAuaMh0JqDm8w8KSvt+J0+d9c3qby1RuPYENNQYsRwYsjx8t4Hms12kO+Nh1UsVnr
         Xehdt9R8sfJdx2ZHJ1khcBS+fMZl5Yfr7w+NaQUDEhpoFT/WM5MH6VdeZW4bNTat2mDl
         VQKp8KLlr4hiHrWxXc8GcLKd8A/IWMy98JcVhsAjU3VbZGYcjrZxBYrlxoqxnj4t382g
         AJG3ehyQ5m0B3W4bN9Gi18YqBb+xvfQHVzxDk4ng1/tKKrmcqlGLLnrfpYBSSXiHyLiE
         TMLA==
X-Forwarded-Encrypted: i=1; AFNElJ81oIZ9dU0gLPj8vBHu+HfjIaltVJpmKyWi4K1bopYH1RMYWCW0MIQu0vZK5h1agvHcIsMUuLM1sTdypW8eEVQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YzXvdiD/UHYaq3MObitZXufGwRuWaczuHyw1AvzbjmpZauutZgv
	cRQxujrT5sxyY8XvSLh1rULAA0WIl9wyfasvGXYElZjxronELGKCWSubJ0B11PGcnwNJUdHOCGb
	p4REcGqlUZykmP4qUgE5MlvWyX0wJbfoqxkkt467l
X-Gm-Gg: Acq92OFhrYRPejg7/ofg6AhikcMGlPCHeq0ScTYxAHOhGLQDwbEi1R6H4KTu2jz4Bjy
	pks1pUegkVgKcKdjTMJPBWgCHCb+0QaaZosZdZzu1BJwImql1P865TjpMqAu3mMX+gS7VSa8Z3n
	LQZ4yG99sR3v5xDXInk9q6/eVsk9EEUf75aSXcwhGybzaTAsNQZrGWC251jUiFIg8sBuYUhrWYW
	cEPpGH9yJ9e+iFIbBRnTh54y5FZVUKj+53lrtBmAXi1odwQpIEzPK7L50uR+ll3dogwsCF3zGUi
	AgJo04alwh0/boSp
X-Received: by 2002:a05:6402:5050:b0:676:67ec:abaf with SMTP id
 4fb4d7f45d1cf-6827bf5f4b3mr22466a12.3.1778644718024; Tue, 12 May 2026
 20:58:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260426062718.1238437-1-surenb@google.com> <a27344e1-6f0c-4686-99ac-fc2cfcc5bb06@kernel.org>
In-Reply-To: <a27344e1-6f0c-4686-99ac-fc2cfcc5bb06@kernel.org>
From: Suren Baghdasaryan <surenb@google.com>
Date: Tue, 12 May 2026 20:58:23 -0700
X-Gm-Features: AVHnY4JDQcNVWDMwH3pin_nHYobX8urPy4XDY6wH_-41pJ7n237CNfSG2kbeWQ8
Message-ID: <CAJuCfpG3xZhL94E=yR1KsWs6fVwcdoAECoOaV3UOeB10TXmOeg@mail.gmail.com>
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

On Tue, May 12, 2026 at 2:28=E2=80=AFAM David Hildenbrand (Arm)
<david@kernel.org> wrote:
>
> On 4/26/26 08:27, Suren Baghdasaryan wrote:
> > Use per-vma locks when reading /proc/pid/smaps and /proc/pid/numa_maps
> > similar to /proc/pid/maps to reduce contention on central mmap_lock. On=
e
> > major difference between maps and smaps/numa_maps reading is that the
> > latter executes page table walk which can't be done under RCU due to a
> > possibility of sleeping. Therefore we drop RCU read lock before this wa=
lk
> > while keeping the VMA locked. After the walk we retake RCU read lock,
> > reset VMA iterator and proceed with the next VMA.
>
> With many small VMAs, is that overhead noticable?

It might be but the point of this patchset (and the previous one that
made a similar change for /proc/pid/maps) is to reduce mmap_lock
contention, not to speed up the read operation, which is not a
performance critical part. The original problem that Paul McKenney
described and which kicked these series of changes is that a
low-priority monitoring process reading /proc/pid/{maps|smaps|...} can
block a high-priority updates by holding the mmap_lock. You can see
details about this problem and the numbers Paul obtained with the
previous change in here:
https://lore.kernel.org/all/20250719182854.3166724-1-surenb@google.com/

>
> --
> Cheers,
>
> David
