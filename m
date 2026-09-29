Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1309E3A6EEE
	for <linux-kselftest@vger.kernel.org>; Tue, 29 Sep 2026 07:32:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790667181; cv=pass; b=VS4bYgFpv1JIPejY7ESDF2TYf7zeZgvoTAY6IXKB264sIPAW41+XIrYFrpQEy/Hn3tpjDIgaM0rk4xvVdtan2YnkjmjZPzzE+sAuUKif9+9cA5qp8JVlKNiX7nDyMLXjKlqsgvvspnGzREFYXMyN2vTQ1BCkEicNE+I1Z0Duvx8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790667181; c=relaxed/simple;
	bh=R7xCnuy/7g5iJFczMExEfQo/POzPplLTdlE3AdQob64=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fWpMWaDXt8DiKNOTZEpmD6wvTbsz43o0786mOw4sYdcKJZa+snf+5e10O7DLIPkcHwpFoqx6Izijl4tNCQYZuts34PBfyOrB+S6Xy9+PN67vKq4IS8jzLQ1X56+sxNenu0DPEoU+Grq0iIeQceqIareo408oHqqCjlhwdnioHRM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=H1HB3XiL; arc=pass smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="H1HB3XiL"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2db33db4de9so35615ad.0
        for <linux-kselftest@vger.kernel.org>; Tue, 29 Sep 2026 00:32:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790667179; cv=none;
        d=google.com; s=arc-20260327;
        b=R/H0/GiqzydrtNDnkxTRR14WToOBpxmFnl4GMEEFJXmMh/fII2Y8YpuoB7yZJRjE4y
         80sW9uw/5bpkZnsCkYmSbBHGKrzM9zqMpUuB82QpRwCsPvWRCEu3pAJA8UuXPzmc8Qm1
         IPJ4VZFBU1T5KZDT5PvQ7kAtCVLlav+7X+TVZL5k7OUUPg6o/dXVqftjZadiN8V7rc5L
         9uVrO4/c8ypPnUjuF9iRF1LGL442HozhN2lDjjxMgPv2OLv+cg+kXAgAEsLVEeixY1ST
         tbrkdgqpeINSf5r/u4zHSFu5XWeWO1LylEpCmbsXWOM+WL2AAXy7gQISDBB64//4X/gR
         ibvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=R7xCnuy/7g5iJFczMExEfQo/POzPplLTdlE3AdQob64=;
        fh=37teQj3mKuXHiaHJ5h5yNDjLHO3WwhDpkUAYwjrQMW8=;
        b=SMH5WoKbWEB0zo8UXJPzoAKTLdF8zlhcn0QEbWJ15acJ8v8ssSCJefgRn219n+FKEd
         CadyUb01QtRZ+oND7p1CekVs6KOTl/CiRgHRGVRY3/MzfqY0QFLfNPyIgmTvbkTiBZE9
         18YkKUgGjKsaGOCAr0bUZGSNZ26CyTNQ/Tfx6ts78++C9O6l+B0SkdLJvNgDDIIKymoN
         /wrjbPDi8T/Rx+q48owmMeqAN+UbilW5sbATzVdiRZHy19pjw1lNKhLX4ei+3NSxxyZp
         j5CndNSzufOwRzccCCkN6GVOs5yJPGsZXvtHoDQ/ArSizcKzVLZyTqNsToUP+c1jZR7+
         KGew==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790667179; x=1791271979; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=R7xCnuy/7g5iJFczMExEfQo/POzPplLTdlE3AdQob64=;
        b=H1HB3XiLmsZi7HaOCEcuh3B6nJGFQxSfm5yue3dl7CWNnO0f4kncfZMf3Le4GKCTTp
         DnocZtOTC7/9DnvzKYeQ7jZ9ZUkKgOWwXxGYhTNq0WKGrdHmHxs4oUbSFMema+izDL8V
         N0uetuS1j6qSVq5N/2phKqVGfYlnW+GVeUh9/VyLj6CXqyU/KuBCGmz6McB+HwbQPzn8
         2d4gFHe7L/lEWI4kXazUFzNWu4or4dXFb5vK+sMvPcCIl0XC67gVYAT/A/dvrAFMrUBe
         2pdx67bRtSnfwsdAlI2Fu+WeKPnqmU3tpmxwfEVUueGtGSp2vOhQzwXhJRgbYZOP1cmj
         CMcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790667179; x=1791271979;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=R7xCnuy/7g5iJFczMExEfQo/POzPplLTdlE3AdQob64=;
        b=uW5t0egQAcuMgcbZVgD5Na/W/j1h/l5Kia065KYU66zKKiIC0yBbo77s86VzZAixeG
         yP0pR98dWAkdiZboNLhu2clFq0cvkL8b0n8nyN15N1kaCtWNWSSR52/rNYGHgWagFlGQ
         EumZ0tsBgMbdvP0Uz7OUbKnMS/1gUsTjAmsAZmqH7z/ql8lBc3XCsZW849b9krmlzUz1
         5DgY+hVM3q2ZRkmjf0OG757KiBBEgHGgFeAsLB5T8/1I6YzM2LOy9W/qOZO+hG+w/xdD
         u47yvVCctAFBAAtgG+GKLModSD79Lg3LT4urTcKbWLfGeeIkoeLsvsGp9MbRsAtYSXRo
         73tw==
X-Forwarded-Encrypted: i=1; AKwUvBym/uopCYerdZ10kGpE2B8W7Mgjo3T4JIb1PlM8C2w3HzdrIs01yp9OCDp1Gsmfce6lHvoGkKFZ7Pm8wN/rmMA=@vger.kernel.org
X-Gm-Message-State: AFq9FYKGeL9p/vYTOEoXNpTcPl60lRH+aI4jpNw4jLDAiTapH3vUm8z7
	bQ3qTEhr1dE10OXfLfugC+Fdu8prfRuE9twEonRvc8djOz6kWNOrV0g5rzrvgmzsWWTOrEeduBT
	JhpR7lmKBK/NP/qDKpnKsInNAsbGIhWmPWIvFrecd
X-Gm-Gg: AYBFou0hXLk1tJ5JvdgAUfRAPC0L6ZCM8RwnAKowYlXRcaZggjYST6cSSLm8Ti2RBS0
	AavKJyV7NQv45a+N6uPkcRT/cCcZVFOjFOZxBLLOxgY+NizatgUI27r0/tMh7viG4wn2XU0RyEl
	48N3i0+hO2OqmzpYlC6YGv11YTEkqnsSc2V642ykHFok85AYcxxUJ8+6XABGQwyVzwoLzFRg8l4
	FtnCyWmqJt9NZwQO5+D5vb5IovYj+Cwt87RT6pWAkZ8Thge1s0NS0GxXhJ8PUXGcfSyPZAIIOSI
	r9g7sqF27PEkPfdNK5ujzSyl1U3syGOGjoPMgg6sNmEd/UvWGZ8yx7D92W44JKgzGTeNoOGcaDF
	yBEWuwuPjyYdL
X-Received: by 2002:a17:902:ccce:b0:2d5:db3d:1a44 with SMTP id
 d9443c01a7336-2e2c7a23584mr2335885ad.17.1790667178733; Tue, 29 Sep 2026
 00:32:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260924050009.19974-1-sarthak.sharma@arm.com> <b8da4a73-296b-47f9-95dd-b8a74f3a0984@arm.com>
In-Reply-To: <b8da4a73-296b-47f9-95dd-b8a74f3a0984@arm.com>
From: Kalesh Singh <kaleshsingh@google.com>
Date: Tue, 29 Sep 2026 00:32:46 -0700
X-Gm-Features: AclHuK8NL08FRy_baDRvYY73Pdr5_fLWqFBgJkAq-JJf_OGtsBih00TomEM-M5M
Message-ID: <CAC_TJvexEaehZno0P=xsoCbLw7wgfz+22iV4fwzcuGCiu3vAAw@mail.gmail.com>
Subject: Re: [PATCH RESEND 0/9] selftests/mm: improve mremap_test
To: Sarthak Sharma <sarthak.sharma@arm.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, David Hildenbrand <david@kernel.org>, 
	Lorenzo Stoakes <ljs@kernel.org>, "Liam R . Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, 
	Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, 
	Shuah Khan <shuah@kernel.org>, John Hubbard <jhubbard@nvidia.com>, 
	Anshuman Khandual <anshuman.khandual@arm.com>, Park Tae-sun <ts930@dgu.ac.kr>, linux-mm@kvack.org, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 28, 2026 at 10:54=E2=80=AFPM Sarthak Sharma <sarthak.sharma@arm=
.com> wrote:
>
>
>
> On 9/24/26 10:30 AM, Sarthak Sharma wrote:
> > This series fixes several correctness issues in mremap_test and
> > simplifies and strengthens its data validation.
> >
> > Patch 1 converts the mremap_test to use kselftest helpers, removes
> > manual tracking of failed tests and corrects some spelling errors.
> >
> > Patches 2 to 5 fix userfaultfd skipping, unexpected mremap success
> > handling, multi-VMA data validation and failure reporting when data
> > corruption is detected.
> >
> > Patch 6 removes the randomization and uses a simple pattern based appro=
ach.
> >
> > Patch 7 removes perf tests and timing infrastructure.
> >
> > Patch 8 removes validation threshold and always validates complete mapp=
ings.
> >
> > Patch 9 strengthens the multi VMA validation by also checking the
> > mapping state of holes after remapping.
>
> Hello everyone! Just wanted to check if someone has had a chance to look
> at the series.
>
> Also, Sashiko has a concern [1], and I had the same while posting the
> series. I hope I can get some opinion from the community.
>
> Currently, for PUD remap tests, we allocate a source mapping of 2GB. We
> only fault in the first threshold_mb amount of memory, remap the whole
> region, and validate the already faulted threshold_mb amount of memory,
> which is, by default, equal to 4MB and can be changed by the user by
> supplying a command line option.
>
> Since we plan to remove all command line options from teh selftests, I
> removed threshold_mb altogether, following some discussion on the list
> [2]. This would now cause a 2GB source mapping, and its contents copied
> from another 2GB buffer. This causes the process to have a 4GB RSS.
> Sashiko says that this can cause OOM killing in small CI machines.
>
> Would it be okay to keep a 4GB RSS in this case, or should we find some
> other way of validating a part of the whole range instead?

Hi Sarthak,

IIRC when I initially introduced the test, John was concerned that
validating the whole range would significantly increase the duration
of the mm selftests; this is why the threshold was introduced. Please
check how much it increases if we validate the full range (with
David's suggestions) and if it's no longer a concern from other folks.
I am fine with removing the threshold.

Thanks,
Kalesh

>
> [1]
> https://sashiko.dev/#/patchset/20260924050009.19974-1-sarthak.sharma%40ar=
m.com
>
> [2]
> https://lore.kernel.org/all/2e34b619-085f-4a9c-bb41-bc024fd40dd7@kernel.o=
rg/
