Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C866D2DC336
	for <linux-kselftest@vger.kernel.org>; Wed, 25 Feb 2026 18:46:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772045211; cv=pass; b=kr6T4+9POX4ohVwTqPvnJM7RXGA8+S5tpMVT9SJAmcSGi62122ou7jl0Hs90Ab5J9UH/7V344fJpJGxfZ9AOyzXmaL8TfQlR+yjNWis/2cWxsrWO5U1lW+wVDtq5JC0uEpwkY9bgBLNnjpy7bxsj3w0dGAM9Rk27ISHusJEOXmc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772045211; c=relaxed/simple;
	bh=0N6PIEQkF9K4Mf3+vZgb/e0cIuHyJAzBkOn2Am3gQxw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CbiTLr+RE9z0Py1WuI78EeFI8A5ovCO1e6gtcDrR5i74jVdGrbV64CZGDj9ulqbE3n6KfmZbI2Ze5hlv5FjsQZz2nV06pkKnAVLdXfJD18RGOTMbPZJXVgSbMYmHjWqQ6n2d5rYX3xQtVKodVnO3AdUAoTMUa4rAE2FAwcSo9Vc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=faK3toue; arc=pass smtp.client-ip=209.85.160.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="faK3toue"
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-506a355aedfso52461cf.0
        for <linux-kselftest@vger.kernel.org>; Wed, 25 Feb 2026 10:46:49 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772045209; cv=none;
        d=google.com; s=arc-20240605;
        b=NyIA/aN3X/0YuJ7cojCAShAujDdzStmkvXveHfKaPWNjdi1O2yo50hmUOThsG9ZCOV
         A5ArnP8KJU4u7fDoc8S971nq+vfTxjFvY9zK52WNdkHM6Nh1P9LWprf1b+e10ILCzEmf
         gMCJkqhkoxd/0ZHEMv2nm8rT0juVnLfR+AmC1fhlhDZICCYOwwLCZ+kWNvX3W04yGuI7
         nJBPH0zEuq8wXXt/9a6TS/gLZTjq43ytkrJNQigIi2AoQlXf/QO1OZrmdMg1Pap7PdTl
         iqBEY27x/6lpyQnZtosQ+x0kis29OX16hFm3KSccrThpf6FqhvYST3EvB0PjzxGNfKrs
         yrkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=0N6PIEQkF9K4Mf3+vZgb/e0cIuHyJAzBkOn2Am3gQxw=;
        fh=JZQSG/B/WME0x98cVW8e/hQFtSgo4I+BfrLo4G7Jsf4=;
        b=F6Id1LRtCuCh1dkkbjXxHfz+SoiHD2M2NG7WjtGjiN3W5uo6Ac6YgkdloaS9mcszwi
         bshMYq+RSZc3EGB56n3Nt8bY2LUssMBAnHP7cyP57gffoqlkd08AaEIlyoSOmHLsszhc
         0st4I2j3GGvtONHWcWf1sG+FwXas9ydfzXQ2JNsfH0MrzDx+dVlMsLwrTHeozJ4S8l2U
         BQNAmo+URI5GtWP7it8FA4NtCikL2yNOMgQ1WI7e6TNQwE+P6ZLKMSeW/PRHOrOHq26k
         9gIDjps9nIkHln7ulUOxjoWtEPNf7jf6oiN7jGLoKQV8gFAHqGOrmWj517Nv30fKTsO+
         zErw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1772045209; x=1772650009; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0N6PIEQkF9K4Mf3+vZgb/e0cIuHyJAzBkOn2Am3gQxw=;
        b=faK3toue7YG1cKBnh0C6nVWtV0aQLPqryqY7zjW96oEYiiSieWgVf8zjqD3mmuFrKs
         yLzouk9iqHr2ir6dgAiuj7Y2+yJt/IvuCP2X3BO2TlncBL4W1AS39Bqro9QToBLldeCl
         /07oqvTf5drpQ8qY5db/at7Den5Fe7lLjhdncgmmvhSduUmMF2htjHxilKOifI+enJbY
         UzdqPuw4BttsbwSO8kItt0UCfTbVo2XG/GxfHWcLDPjo62I3eRYf1fDVDtfMzf/124Mb
         P4IzUAYvJDkWWMqOVSTqR9B+nvgDfaNMZiDZONZ+CPEVHcBd1FcwYkFLWn1N80G5Pih6
         vtMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772045209; x=1772650009;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0N6PIEQkF9K4Mf3+vZgb/e0cIuHyJAzBkOn2Am3gQxw=;
        b=BU+hlpISxQquhOAjqHuGiBgTOkiuM7zGra+BMgOtDfmW/cGiYqntXqOLets+T/NPpx
         qxfmnKIb9AV5c3NWlRSMgq5TR8AkJzpCiEouuhhcfZIhfScyuFy4Lv/U6ehBVXe/aolN
         KLhVBJOjfC4hPg0EL7dXCEMSa4m/8MEsTrFn6K3APaYbeZ/Yzlxrr1VVDxSJvck1Rlgp
         JjVfCWPMivB9qgOoDz+7t6c0qAM7+lLhT4pAMIZBL9rd0WR7jbaMGYDJ6T4Cb3AInj4Q
         SfsAgM2yWkN5wM6q1iFYw7IweXDb/+7g+tFtzRWq04aPuA9np8Wls25urbzdKUafHjuZ
         p8RA==
X-Forwarded-Encrypted: i=1; AJvYcCVonVCGF0Occe99rtejpjIbaH4EGMZoxFogrHjQHp5pVAd+FxtIGdPdQemgPMk1iuZB4l+Ep/o5glR0tEkESB8=@vger.kernel.org
X-Gm-Message-State: AOJu0YwNAE9WNFVzCUX6V/8v1i/30oQyETKcEt2juVu0EAb8mfrUqfEL
	FC0O8zGK5VmUEHAMH2X3DWXbzdH1q4wVfKM9AkzzM4827jjcBwbGD43iCkTvxmrNKrO+RQ0NqHX
	RSz4GHLZ9AQ47phbP0fBK3RAjurkYxrgJg9zPwOYy
X-Gm-Gg: ATEYQzwtAddjByMij8bojN3b/wjlC4UkCc570+XKDYZJehTlHYj1e2IhHgwofYz8p6y
	12yCUd+GCybPR7hepU19T4geMCs094G5+jJhEG/VGQqVuZVjrpz1nyxGbVRyE0X36GLByN19xof
	o8KJyoKqbgVJkghfPNzt20Xxy/acADkATuGbzLXI1B5uWMkc4zRyHuRCgIXkf6t99XPaG62qYfn
	SYZPiFA5HjmVsCF8rJ/hVTgfaq6ZzNRiihMir7twusYM8WxhmG+BkEGbXQPHCYEiFZTh0WwnDr2
	A8PAYq3+isSbrEcqA29Wjp4GUPmSZRXhrbX5hA==
X-Received: by 2002:ac8:58c4:0:b0:506:a1b1:422d with SMTP id
 d75a77b69052e-507441e2f1dmr647121cf.14.1772045208089; Wed, 25 Feb 2026
 10:46:48 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260225133229.550302-1-ptikhomirov@virtuozzo.com> <20260225133229.550302-3-ptikhomirov@virtuozzo.com>
In-Reply-To: <20260225133229.550302-3-ptikhomirov@virtuozzo.com>
From: Andrei Vagin <avagin@google.com>
Date: Wed, 25 Feb 2026 10:46:35 -0800
X-Gm-Features: AaiRm50yP7U5Mblj8nExlDPbtbQY6Smjt4Ct49GvH3x6Zklgi4smtXG6r6gKV_U
Message-ID: <CAEWA0a5s5fvERdrk1mUAqo+VYimGty9=BU1DEmPHDugLcgPevQ@mail.gmail.com>
Subject: Re: [PATCH v4 2/4] pid: check init is created first after idr alloc
To: Pavel Tikhomirov <ptikhomirov@virtuozzo.com>
Cc: Christian Brauner <brauner@kernel.org>, Shuah Khan <shuah@kernel.org>, Kees Cook <kees@kernel.org>, 
	Andrew Morton <akpm@linux-foundation.org>, David Hildenbrand <david@kernel.org>, 
	Ingo Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>, 
	Juri Lelli <juri.lelli@redhat.com>, Vincent Guittot <vincent.guittot@linaro.org>, 
	Jan Kara <jack@suse.cz>, Oleg Nesterov <oleg@redhat.com>, Aleksa Sarai <cyphar@cyphar.com>, 
	Kirill Tkhai <tkhai@ya.ru>, Alexander Mikhalitsyn <alexander@mihalicyn.com>, Adrian Reber <areber@redhat.com>, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 25, 2026 at 5:33=E2=80=AFAM Pavel Tikhomirov
<ptikhomirov@virtuozzo.com> wrote:
>
> This moves the condition (tid !=3D 1 && !tmp->child_reaper) to after idr
> alloc, so it not only covers that first process in pid namespace has pid
> 1 in case of clone3(set_tid) requesting wrong pid, but also if idr
> itself gives wrong pid for some reason.
>
> This could've been the case before this patch, when creating first
> process the alloc_pid()->pidfs_add_pid() code path fails, so that the
> idr->idr_next is non zero anymore and next process calling to
> alloc_pid(), will get 2 as a pid from idr_alloc_cyclic(). Though thanks
> to PIDNS_ADDING logic, free_pid() disables further pid allocation in
> this case and it does not lead to any real problem.
>
> Note: This is also a preparation for the next patch in the series, which
> will introduce an ability of creating init from the task different to
> the task which had created the pid namespace. Needed to make sure that
> init is always first, even in this new case.
>
> Suggested-by: Oleg Nesterov <oleg@redhat.com>
> Signed-off-by: Oleg Nesterov <oleg@redhat.com>
> Signed-off-by: Pavel Tikhomirov <ptikhomirov@virtuozzo.com>

Acked-by: Andrei Vagin <avagin@google.com>

Thanks,
Andrei
