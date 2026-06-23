Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93341307AE3
	for <linux-kselftest@vger.kernel.org>; Tue, 23 Jun 2026 16:01:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782230484; cv=pass; b=eedMUlCejsh+i69n/1q1I5d6NJuwHoUtQTVfWg4hue0disCmdAbSuxGXuI6nykFC8sWXM8fJLS/nPh/cDbp9qs+ipAuPJR1Ww/6XH8Lm1B1kthoMS5PSuQQXkkl6BHnU/7gyTnTpveoHIxCKoHagE3Ci1K7/gS/lQlhiR800aQs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782230484; c=relaxed/simple;
	bh=moYzU94ucfDv9Ns4t0FmkzpOqQLV5Y4B3n5z4+leBVY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kKgkts591vLkOCTRdh3RHU3MxoMdJSo/DC4GLFBoL0QayCVeBNNdCEKh1Dd+wD37GNy74Ri0FnsGMmlgdwphFfYIjFqUTdCrg9+4iA9KA1FYJcR5FiFrl2AQ8mOOv9W63a10+gl52oos9a1c1fuayvDOhivg5AmxO2xXNNs0zJM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mDUT+SxN; arc=pass smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mDUT+SxN"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-490b8ac62baso11968975e9.0
        for <linux-kselftest@vger.kernel.org>; Tue, 23 Jun 2026 09:01:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782230481; cv=none;
        d=google.com; s=arc-20260327;
        b=X2jz1gIHGDS/XRwh5FskV+kxIZdgNmAzhgLvik/FET3fSqmzTojBFuQGSBvim5fmr+
         ixFeRzmMB71H4+sQkoB4LSvT56LWlVt1INS/wNXJREoiNEqQtxt5r7WtZLE1VA8YKeEY
         JNVBNMTr8Pcwdzq997GMfvP3N9+Lp5HGjFpFVWvpkOdPaTHckUM3pQ+Q7+gMnaiF9zrj
         BPixktAS3TuI3U7kw8xkZzfNcp33qpqVtY/h98Pnuk37aqUMBcJhk5oAVzOjjTm5R8bK
         GQ8D8WXo4WDcHciWQBSRBSLdlVnnwrjjZiovQpBNmPRnbn0L1VRUJd35ScG6W5Kh2b29
         j9+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=s/dOweBfHSKsBXHjB0p74I+BF7H4VxwvcYuFUhDSwpQ=;
        fh=djEwljv4mbLjyTjlZclUpvAxmlVh5O5GJ+Q66n3XNYU=;
        b=WlFTwL2pOq+lxIVepIQKJUW2eIlHW1ev0zuaIseun7OeheMpj5SPOaUFhMqYywwypH
         MXjBCzhemM6yZfMc+oFYF2XyS5+Aut2KsLvrBn1PPXjDnsp1OcK2RTcEEklCJfoJkHGd
         wvl5K5sTEQdwIg95IB28wfP1ZRSQPmNouNwQUXHqYn/3N2GJSBTnfwpboB2Zl9t+RTE6
         tGg6TPWKIcnnMvTz4FLiSQ6tzzHEhEgSSLAzHd6emSjznpHLMMHu2P3xAf5ENyafr6RB
         GXUYZDDPsR6+lVunoZ0ieVnD4ExGkMBWhGgve13vRyF3tmaI3bKoFAJLt6z8B4wTlMGW
         6fiw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782230481; x=1782835281; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s/dOweBfHSKsBXHjB0p74I+BF7H4VxwvcYuFUhDSwpQ=;
        b=mDUT+SxNtY8wPw8JLRXJdWRSX3bGO2cboOMb/HtZxGz3piNl6QUNZDmEq5Y99jnUpJ
         rv9xv9ZKXKEEGgZjC6o0hqzWTGvm8MVMBp/V1VJsIaK6eg9L1cZ5Vo7lzYN5HeTZXkrm
         VbY/NDZBbbRpGxBiM/UpljhJoJl8lCCO2qyLubFT4PBhnyocQDe9jSRYT9uVTC5mB9K3
         fxEUdiag2v3CifSUchmzAtlSKv1I0zT5z8z2ybzF8rEvyrI5JOt7LtoTweWEgqnl1lMx
         +8bD17Rf/77AKta+qv5Tp+BA+SQeiGQ1H5wXP1R/DaSPbU+x/GJxs3duhzyKBXGWJMbE
         NZMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782230481; x=1782835281;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=s/dOweBfHSKsBXHjB0p74I+BF7H4VxwvcYuFUhDSwpQ=;
        b=VO+EY9e/C7+rya2m+S1E5HIMjBIiy8fq1t08Lh8Iw1jYDDJS4/6Oe2yDurMwal7YwE
         lZbsS0/88Gk782e2sC9ZlHdVPedi2UdGlDWSEEDwH7XLuc5LaZuSd4ktWsAtd/ddfKLP
         iNubvxHY9b2SukCo/tYp/3gYZ7KRakz7DRXrEud/5duML1thrlAlLlIQ+MlWrlrLm1iJ
         qq6x7pOgQXT3GvQNqDconzd58E5LGHTyle2c7GZwOsbTVR/7RS6+Gt3QUv7vuOfykCwW
         qFzViKYxhqDlKsfeJpaVqP8Wkncj/nA3c8My0grYSZ4l1rwtVd6t2M/wc2vWPG1sLhsC
         7lfg==
X-Forwarded-Encrypted: i=1; AFNElJ8eUK7OvOs9Rc5w0i1LCtzYW7/5mwxkqpzPAZLQaGjTxZ7C4giJ+5/oqm0JyhpFKjxrPYBV0X1WTXtmG1BG4Lw=@vger.kernel.org
X-Gm-Message-State: AOJu0YzTlB8hU7wFRKm9deVxyP9joHJ3IDgw4aXIeESZywPJrYj/NIrg
	HZCjvI+RLBJAuk+PKdOSl5+XmIaCjQ4f2GwXqclvsKTB7KFL0WncZaaES1OyCvgB/p7houLM1b7
	bb+FzX4zsT6Gu090RUDktU7NzFWYWly0=
X-Gm-Gg: AfdE7cmhgjRvRv6s/KISity++LMceoNMrWy1P+4Ej19shxBIr1hsvKrL6bB5CcyAGGX
	oqI8Y7yGM4MGO2Ba2RIlBmcfTNrZqOs6Uf4k5QA/LpQmVW50Rq0YPgzJCaBVL/GFUhGlxUcluwA
	ufYMZZ9vURXgA5BtLrXda/epMKZj541uKqjjGfYU81zIU8HWJUvHdFmQwW40mkDQ7GPi1ZeMip3
	QCLJw/94SQIb+o8zHKCScn79rkyEP256+Z1skZafn1a2Mi13bdys675hi0TkACAExMKxEpojDKV
	Bw+BwzZVxqGA8f41jIOqwWFLr4B/
X-Received: by 2002:a05:600c:c099:b0:48a:5f32:62c6 with SMTP id
 5b1f17b1804b1-4925a0ea8b4mr54371835e9.11.1782230480787; Tue, 23 Jun 2026
 09:01:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260623111533.2285005-1-ptikhomirov@virtuozzo.com> <20260623111533.2285005-2-ptikhomirov@virtuozzo.com>
In-Reply-To: <20260623111533.2285005-2-ptikhomirov@virtuozzo.com>
From: Nhat Pham <nphamcs@gmail.com>
Date: Tue, 23 Jun 2026 09:01:09 -0700
X-Gm-Features: AVVi8CexJwF1YIejddCZO0Cw6M7tITGeNOUnTTqz8Z9zx_6aZedVwaVA3e5pkZk
Message-ID: <CAKEwX=Omr29YZ+ZtDXtVLKQVoinGo3y9xWBJojRCBpewgswycg@mail.gmail.com>
Subject: Re: [PATCH 1/3] fs, mm: add ->cachestat() file operation
To: Pavel Tikhomirov <ptikhomirov@virtuozzo.com>
Cc: Miklos Szeredi <miklos@szeredi.hu>, Amir Goldstein <amir73il@gmail.com>, 
	Alexander Viro <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>, 
	"Matthew Wilcox (Oracle)" <willy@infradead.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Johannes Weiner <hannes@cmpxchg.org>, Shuah Khan <shuah@kernel.org>, linux-unionfs@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
	linux-mm@kvack.org, linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 23, 2026 at 4:15=E2=80=AFAM Pavel Tikhomirov
<ptikhomirov@virtuozzo.com> wrote:
>
> The cachestat() syscall reads page cache statistics straight from the
> file's f_mapping. Stackable filesystems such as overlayfs keep the data
> pages in an underlying inode's mapping rather than in the overlay
> inode's, so cachestat() reports all zeroes for them.
>
> Add a ->cachestat() file operation and route the syscall through a new
> vfs_cachestat() helper that calls it when present, falling back to
> file's f_mapping otherwise. This lets stackable filesystems forward the
> query to the file that actually owns the page cache. No behaviour change
> for regular files.
>
> Signed-off-by: Pavel Tikhomirov <ptikhomirov@virtuozzo.com>
> ---
> Note: Memset change might be a bit tricky, I moved it to no
> ->cachestat() path to avoid multiple memset on nested overlayfs, that
> means that ->cachestat() is expected to be able to handle unitialized
> cs.

nit: maybe a comment somewhere to document this?

> ---
>  include/linux/fs.h | 10 ++++++++++
>  mm/filemap.c       | 43 +++++++++++++++++++++++++++++++++++--------
>  2 files changed, 45 insertions(+), 8 deletions(-)
>

LGTM otherwise. With Amir's suggestions incorporated:

Acked-by: Nhat Pham <nphamcs@gmail.com>
