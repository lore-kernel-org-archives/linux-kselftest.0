Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C13C025B0A3
	for <linux-kselftest@vger.kernel.org>; Sat,  1 Aug 2026 22:34:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.180
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785623690; cv=pass; b=tpIj0D+tAJEWHRKYNIPP/y+N5aQyMYDeb85w0RurTcfM2SXLF09RnKHjNJ4+BaZbqzy9VTVJLTKKUIo9KewRC7+EKcUoxhpq3xlejMDD4g7n4FeTRi0M5N9bbd3eCMLN6osvOKVW6yAadKgw8T57TcZvfBg8/gk3gO0gdSo+PJk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785623690; c=relaxed/simple;
	bh=rsrWWP93rEAeLKQW5ZOJ7qtuRjB2U/2YwjmAHNYRqFs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EIvgBu8xBOtD0wLG8wNQXATZMNdPvpHSDi5wps/NzTUu4wl7Zg4+7LMN4S1MNM32M1/D5O3ldywSp/zmmwQTCKS5nfunHsttmh4q/eSeKiozbdXuPZPRtv9y2wzhOMulUnkCjZboQI0vYY2/Oj347mgLg2wgZhXHvoBErzNn0sU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=MY5VVYJg; arc=pass smtp.client-ip=209.85.160.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="MY5VVYJg"
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-51c01c79467so179981cf.0
        for <linux-kselftest@vger.kernel.org>; Sat, 01 Aug 2026 15:34:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785623688; cv=none;
        d=google.com; s=arc-20260327;
        b=iqnejCNOqHACJAoH2Ejw+4uvVOfIlqsod188w3pU69sdKeF0isJDqR0uRLX/DPqDJ5
         9WsjGRKRD4qXNNx0/RvdhJVll19rLQSJOJSyyAn1K9wpAE/IW5X+XBn+dEH3lumJU1ph
         orqHCBf2z5ryGB5UP/moyGTfHPfGfrqFkratB/ulNxb6H99z8+/5M+CAJI/+gOSiKPNz
         1SnxuBnE7n8749oie8GbXv5QgvTQbmo98MGclj+NP6FLj1203IdJM4t8hQrRSoJ7a2Om
         CSKeIAJrn+AQQYOKdvF1HIzMPS89Cmb9vIo/eMzS/6nef2KBdn+lqnxoyTxzMDnFZd/4
         QxpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Ge2Z+XX709xzAtZe7afFgNbCFGM6FF+LCnu7eUBhqgE=;
        fh=B/kDbCdrcuMdWVAKa7K4tNepmXIlSam9nbRGlpH8oLM=;
        b=Mge72bnRQinfUhdk4gzhJZS8l985Qkuke7ztyW5o39RLGz2wjnf99GWuSo/EKf+Izc
         7aUrveg2/laUeKx5+tREdrmW4Lvk2B3iUNd9sT+OPXs8IvKoXykVpc33PqMaSS7ZJsBM
         qW9u1lVqBLnvfHrnHY+E4es7Z4eS+CvYnQwqyRHOVKGmiEH2V8/tdvxnSFdyoWiJwUu8
         6cxp4i/5Ses8dBBvQvUb1KVNh2fhcJbExBJlgVXnRVtxVa0SHhGqKmF2s6Rnqifhdidp
         bbR46We6jT/S6z4OrYvUhrBBI5SeJF4nHwGwdqlxwEo27wsjlvOlixJ2fdaKFUfGBE8S
         6MWQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1785623688; x=1786228488; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Ge2Z+XX709xzAtZe7afFgNbCFGM6FF+LCnu7eUBhqgE=;
        b=MY5VVYJgxCbu0D99Y/LK4Dvcnoj1q29XfQCb14AsmDACdRkt6fsMNfFJiduYnH9HMv
         TTyxA0N8BkmI8Q2gvi+z5oJFa5iA6GNvtyl+OqU76xow8p42GDNJXrIgB/McFA3HoH7y
         ZCgvagBhtgMYszMEuN1529evVncwHCQ9qYFDIfaC4SG5FL6tWcCu/MoA5kAh2hATfj6g
         0rhohytWQKOUunqLRbrAViat2CvbiK8urTaKVfrljS8LgQk6m/dYd0cYLtkdjJLhksKD
         gP//7UGuH123psjhtoRm8ier7buFY8o5Kwsvvpt6AGSs4dSgTCAxAlytcFb2u3LKgPes
         E+eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785623688; x=1786228488;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ge2Z+XX709xzAtZe7afFgNbCFGM6FF+LCnu7eUBhqgE=;
        b=auLgDsMBNe6cXPWpY7hXwNaKDoqtycQ3UHKEUZRk5GtJYbz0hbozAehp2qv2LpxdXE
         V4sq8s7iz0IWzw+RNiqMp12x1OZ2f9egQne5Lu5eCybbliOPRtrFv3QFgNu6GcrDIOrZ
         MFQSdMIwXKOP0PcBLXhCW4PIC8Z4i7ZzHe5x4yYppcSbw/EZgF1oROX0aUKHHQi/5cVZ
         RGkIFsfMdTGVU5UsRt9hKMufIYsgCCLGC3l5jDSmv3T/OnH6J2Me6GCpxbKBZFJVSlh1
         OQ/8CWkyAB9fkyQ/EhOGMZZM+vhtNfdjneL8IG3iGRxQKU9N6U0lBPIgNFV8mOYmvggJ
         rhQA==
X-Forwarded-Encrypted: i=1; AHgh+RoFiTZuM0oQgtwZSPvYHEMlvh2VHgusOw2FXK6qyQ3nENSYxmrKvynqN34QB97M3vr7mzFUuxhUitcrxi/v9xs=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzko3y1cWGMqU/TP2kflv8YdoRM5ebg4/0S8v+7fINSWLa3MDCy
	zdmhR623zRnxaULAGfcbhf3ZqAkylj4zfC9bv6L8MMoCej1vDtTWsqLsDyF/dDztoAJo0FqMmQy
	aQMTmiMRxo08u9jxp05PI6SSlFLh4IacEAgyDbzf6
X-Gm-Gg: AR+sD11XdNLhx5P9kC57MzMp/j+6NMwH4PWilIdFu3rgLvMNWGctRxfgzdnPf8aDpys
	V7dItHYyuOcaqnaz0fWci+2rWjv2VakmZ4lJ/HnH45d0XRN1mfSD3lJld0mygb1TR91kM56JTDp
	8zkmMOhqNfxxTGQqsNW0oB/4YqNTZ9ijTNHPMk9ZLDfHyYTmOaHS5p8nsqynzUOQTQx2vLa/5WI
	SG61bEqSzQRcGyxxTv/Ak0KNjlokIW+jBZii9z5ofpFf87h04lKd7k2OJ9u47pkFTLiD8T3lRpC
	bJC9ms9Iktag5da8IOV98voAeZiOD/SL3zdlrtUvuI4SBAcguDItkw33zdb9T1RCHErpcNyorFK
	pKw==
X-Received: by 2002:a05:622a:1823:b0:51c:935d:8d74 with SMTP id
 d75a77b69052e-52b5b0e51demr14219141cf.9.1785623687170; Sat, 01 Aug 2026
 15:34:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260512010148.1175-1-sj@kernel.org> <8356ad87-9c1e-4068-b5ee-86e8bb669c3b@arm.com>
In-Reply-To: <8356ad87-9c1e-4068-b5ee-86e8bb669c3b@arm.com>
From: Pratyush Mallick <pratmal@google.com>
Date: Sat, 1 Aug 2026 15:34:35 -0700
X-Gm-Features: AUfX_mz696M7XR-goPw8_g3II4Wu2Zq38_AHsPjgxwAEVHxBd9Y69N2bHp4o46g
Message-ID: <CALHaPKcpWpT=T34_9dKHPNtAqvwHs=_Z0Sv1TS9jC7ezoRnQHg@mail.gmail.com>
Subject: Re: [PATCH v3 0/2] selftests/mm: use pattern matching in .gitignore
To: Sarthak Sharma <sarthak.sharma@arm.com>
Cc: SeongJae Park <sj@kernel.org>, akpm@linux-foundation.org, shuah@kernel.org, 
	yosry@kernel.org, david@kernel.org, ljs@kernel.org, Liam.Howlett@oracle.com, 
	vbabka@kernel.org, rppt@kernel.org, surenb@google.com, mhocko@suse.com, 
	linux-mm@kvack.org, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Sarthak,

Thanks for the reminder. I completely forgot about this.

Will send a V4 with the patches reordered.

Regards,
Pratyush

On Fri, Jul 31, 2026 at 2:16=E2=80=AFAM Sarthak Sharma <sarthak.sharma@arm.=
com> wrote:
>
> Hi Pratyush and SeongJae!
>
> On 5/12/26 6:31 AM, SeongJae Park wrote:
> > On Mon, 11 May 2026 17:34:09 +0000 pratmal@google.com wrote:
> >
> >> From: Pratyush Mallick <pratmal@google.com>
> >>
> >> The current selftests/mm/.gitignore hardcodes each generated test bina=
ry
> >> by name, which requires manual updates every time a new test is added.
> >>
> >> This series switches to a pattern-matching approach (similar to KVM
> >> selftests), ignoring everything by default and allowing specific sourc=
e
> >> extensions. To accommodate this without tracking generated headers,
> >> local_config.h is renamed to local_config.h_gen.
> >>
> >> Changelog since v2:
> >> - Split the changes into two separate patches (header rename and
> >>   .gitignore update)
> >> - Added Suggested-by for David Hildenbrand for the header rename appro=
ach.
> >> - Dropped David's and Yosry's Reviewed-by tags.
> >> - Kept Lorenzo Stoakes's Reviewed-by and added Mike Rapoport's Acked-b=
y.
> >>
> >> Changelog since v1 (RFC):
> >> - Renamed local_config.h to local_config.h_gen to avoid conflict with =
!*.h.
> >> - Updated Makefile, check_config.sh, and affected .c files for the ren=
ame.
> >> - Removed *.mod.c as it was unnecessary.
> >
> > Adding previous revision links together [1] would be helpful for people=
 who
> > willing to see details of previous discussions.
> >
> >>
> >> Pratyush Mallick (2):
> >>   selftests/mm: use pattern matching in .gitignore
> >>   selftests/mm: rename local_config.h to local_config.h_gen
> >
> > So, after applying the first patch, we may show local_config.h unexpect=
edly
> > shown on 'git status' output?  Maybe too trivial thing, but I'm wonderi=
ng if we
> > already considered doing the renaming first.
>
> Just a gentle ping on this patchset, since it has been some time since
> the last discussion :).
>
> Would it make sense to reorder the patches as SeongJae suggested and
> respin? Pratyush, if you don't have time to send a v4, I would be happy
> to prepare and send it. Please let me know if you'd like me to.
>
> >
> > [1] https://docs.kernel.org/process/submitting-patches.html#commentary
> >
> >
> > Thanks,
> > SJ
> >
> > [...]
> >
>
> Thanks,
> Sarthak
>
