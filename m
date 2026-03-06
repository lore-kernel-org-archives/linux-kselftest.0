Received: from mail-dl1-f51.google.com (mail-dl1-f51.google.com [74.125.82.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BF172206AC
	for <linux-kselftest@vger.kernel.org>; Fri,  6 Mar 2026 05:47:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772776080; cv=pass; b=JAQGKsruw2KLQTOgkJazT7rYL2EDc2SpyDGziV9YPsYhhbSOHnb9HjGIc8zytrbfrHl9TQuoaBZaWZjXHHgpEgm4RSRhRVtp/3+JrySnduqk6WIGQt+yLSFPfwnUMgxazKQ3tuQlr3KK62afFB/fInc8KdhBLmyY35pbYTNMDj0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772776080; c=relaxed/simple;
	bh=FWoKnzFkU1fho+/6SGBYDFjVkFjVU4+0P4fHA5HMTy8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OUQ6kyl6DSR1HOVKv9O5ivpP8jzKXR5OtG8dGwDz079Ms1jEloy912RRwsJS0RNsOkNiQDXGT1DcUjGl2XSe7jyDp8s7Rw1pIxKkbsrl0GzZdmTAfeWZQLTxq5gV076MPkbYs+CFABAejtIubzRH4v2X9wMbK1yfmGPg0wS9PCU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=2v0e1a9J; arc=pass smtp.client-ip=74.125.82.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="2v0e1a9J"
Received: by mail-dl1-f51.google.com with SMTP id a92af1059eb24-1279eced0b9so7600194c88.0
        for <linux-kselftest@vger.kernel.org>; Thu, 05 Mar 2026 21:47:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772776077; cv=none;
        d=google.com; s=arc-20240605;
        b=fn9jh1U8qM6ROjquBncMdJC6X4ul5W6T31n8sKNDb+FFSaENsQ6sySWEP0nzMkYo1S
         QMQAe2PAfWx3P9hfzpKNLU8GdwfYr1iWhUvOB4djN0bLm1y2Kyb4xbbnCGUi2DOcJ+LV
         CjqeMKNh8s3a2aGTliHV/VuSbX2KpawohH8U01en/TS2w7BVhdwsbYSuheLExI+/Qi7F
         aFMg92erf1NNV+GHre31xG7+kSndrudGPtXebirnTe0gqtSxY+YoZFxl1KX0k7isNj5P
         v95kYVrcGk93cFAJ1qN9CmHkSwh6lJYaXU9M4GxF7Zo47vUab5kXnOrsKcDAysEUR4kl
         3CWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=gpXO7mHlaGT+SvMmByXwqY9ET8QOSb7XZwHnLOlPXCw=;
        fh=f3GVq+8yUnk3QpXpW1prTdL6S+/kFlgAZ8HnecglIkA=;
        b=kjRf8JMEWFiLqvVuuplW8i0eJTXv64radrJJAtspL9hyM7cGasrNfCtXbIaHIr0Msv
         4IqQ9BRGxgnCM3b6qESVwGYo07+QgFt3rUzXrg22yZb377R/MRTr1JcSjECmmPc/utS0
         DT0/W05h/Suc+a2ggcpmGx/vMDiEv0kp3lg4zqajT9JQNtc0GHXUt4F29bXeHn3tCKVG
         Wxi4shwI8tJm3Cd2tP2ZwZ48hMkS+WLYPA+V6/abgmqWKQNRZ/nZVbd2dcLRrf+MDFeX
         AUe7tbDKW7jdfICDeR0E2NV/KqC5GMPvwXsIE6twBIIWf7seAuGuIAdLdrpxp2zUVvW3
         XO6g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1772776077; x=1773380877; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gpXO7mHlaGT+SvMmByXwqY9ET8QOSb7XZwHnLOlPXCw=;
        b=2v0e1a9JEOR8zNQUmfjtW3wi0m/G4WxMvKR7bat+cH/6HNE8pdFJdKITXphSCUbn91
         5Tgmf5g+6xeOw4ORMP9qvbw/rbc03dmet6xTn3HPz5356yS/uaVgIDGgiKyFD5Sy9rTs
         tY/U4AXi78fY2aeA8if9lSQsVjD+Mx0WOaPtrS/lrTj0nIMqrUJUEag+suicHin2fOKZ
         kmjC7RokPiEliw1CBdp8xyXj7lHoG/OpcNsPeKZC5e73qxDKPkTN6sddRxRzLlTmfFXc
         ZeQIJ5WMVJlYj/w/h4ObZRdRJNwjMEt26dfJOhPQ/Z2G5AYFT6blJgYtxiNyLKLZA8il
         fvBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772776077; x=1773380877;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=gpXO7mHlaGT+SvMmByXwqY9ET8QOSb7XZwHnLOlPXCw=;
        b=uCabzUOX42VkFKuEAd9L3HivwuWOyrlcuOe0ZBlGFymo54v+gDS3QSwpM4bbNi3WIz
         WqtlHGGEIbdZsq7zGY/VfYbGRKmmO0X9KbR+y8eQcqJyuVhdGVVOKnNYXPjEJvVr2ZbE
         CXXGfUY8DqQPReoq07itCkhZ73AEKkr5+KqKD1MvB7gKqcILABbs+4qhvk2KR4GUrkN6
         8sXKcIIBFEIqLIWhEH4Vcb3pYB8xmdBoWLJZYxhIZ9REC3paOqvfD12yedOqJXBN1rRr
         i7+dkHnR3owYk/gqBfr/LOB/GU0M11Mr4k5wRT8NaJkNMcTsTU+/pYwwrgDEvQyBmJDj
         5UvQ==
X-Forwarded-Encrypted: i=1; AJvYcCWhOA8e8rvkz2K2/UIe3a+84v6PpLWS2at4G1HX+JDjkixBu+kOk8l1GblwI0IFq6EzCUqhVigZyzdagOPEUIw=@vger.kernel.org
X-Gm-Message-State: AOJu0YzYqKNNEYJ9ePHJbnOhwYBRnMyuVVnmI2REKl/Ycv594IDHqTyB
	V/pCX3ae1IZ3yf4C6zfOw/rnxFEI1u39K0uNXCk8Du+k1Mr3sFUUgOZG5Kni/fpdO5hqk2lYkwg
	iQmXCK6etVqzVLHEilF6htMoBZ6jG5wkNuFwR1vze
X-Gm-Gg: ATEYQzyjNvy7SYgCNtC7Y/aqcF/jxp86pM5IIMPxQ6TGAEXJOqmbMU/kafj1vyvfBdz
	qjkpYP3F2K6EuqmXgzYYK/gbewdPgIMaYZJlzCSKo2c3l9uJOE+o9I38+RPNvxBEEebWvjU8qa+
	5Mh/gNoWbvpI0gRLZmoG4iGy4GhlEqg/7ephtKyIeNxIsrWpfDJG2ww7KWfFLCgp8saIxUcOrt5
	CkatnjCN7HEo1HYn31shCbAcQH7ybK/oSnk2iZ3wZf6sh8Ljnb3Y8x8rWmQve5BZZbRmdC20BeJ
	LS/zj6vCOyCknyvzLiJl8GN9MdVGN8slWt9ST77bCipHzTttDlSXifptVjyw1EwLNJY5qNN8vDq
	90cRjEoM=
X-Received: by 2002:a05:7022:117:b0:119:e56b:91ec with SMTP id
 a92af1059eb24-128c2e8b925mr401820c88.29.1772776076587; Thu, 05 Mar 2026
 21:47:56 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260306-unix-proto-update-null-ptr-deref-v3-0-2f0c7410c523@rbox.co>
 <20260306-unix-proto-update-null-ptr-deref-v3-3-2f0c7410c523@rbox.co>
In-Reply-To: <20260306-unix-proto-update-null-ptr-deref-v3-3-2f0c7410c523@rbox.co>
From: Kuniyuki Iwashima <kuniyu@google.com>
Date: Thu, 5 Mar 2026 21:47:43 -0800
X-Gm-Features: AaiRm51rtVtTlMmtHwM6HAI4yCYAH4c9qJkSJtwY41_Op2u8ii9foodM1xMuJa8
Message-ID: <CAAVpQUAdOCM1h-G-vU+tdEdOqc5+YoHypKwV_w5m4bAA4Ai8Yw@mail.gmail.com>
Subject: Re: [PATCH bpf v3 3/5] bpf, sockmap: Fix af_unix iter deadlock
To: Michal Luczaj <mhal@rbox.co>
Cc: John Fastabend <john.fastabend@gmail.com>, Jakub Sitnicki <jakub@cloudflare.com>, 
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, 
	Willem de Bruijn <willemb@google.com>, "David S. Miller" <davem@davemloft.net>, 
	Jakub Kicinski <kuba@kernel.org>, Simon Horman <horms@kernel.org>, Yonghong Song <yhs@fb.com>, 
	Andrii Nakryiko <andrii@kernel.org>, Alexei Starovoitov <ast@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, Martin KaFai Lau <martin.lau@linux.dev>, 
	Eduard Zingerman <eddyz87@gmail.com>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, KP Singh <kpsingh@kernel.org>, 
	Stanislav Fomichev <sdf@fomichev.me>, Hao Luo <haoluo@google.com>, Jiri Olsa <jolsa@kernel.org>, 
	Shuah Khan <shuah@kernel.org>, Cong Wang <cong.wang@bytedance.com>, netdev@vger.kernel.org, 
	bpf@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 5, 2026 at 3:32=E2=80=AFPM Michal Luczaj <mhal@rbox.co> wrote:
>
> bpf_iter_unix_seq_show() may deadlock when lock_sock_fast() takes the fas=
t
> path and the iter prog attempts to update a sockmap. Which ends up spinni=
ng
> at sock_map_update_elem()'s bh_lock_sock():
>
> WARNING: possible recursive locking detected
> test_progs/1393 is trying to acquire lock:
> ffff88811ec25f58 (slock-AF_UNIX){+...}-{3:3}, at: sock_map_update_elem+0x=
db/0x1f0
>
> but task is already holding lock:
> ffff88811ec25f58 (slock-AF_UNIX){+...}-{3:3}, at: __lock_sock_fast+0x37/0=
xe0
>
> other info that might help us debug this:
>  Possible unsafe locking scenario:
>
>        CPU0
>        ----
>   lock(slock-AF_UNIX);
>   lock(slock-AF_UNIX);
>
>  *** DEADLOCK ***
>
>  May be due to missing lock nesting notation
>
> 4 locks held by test_progs/1393:
>  #0: ffff88814b59c790 (&p->lock){+.+.}-{4:4}, at: bpf_seq_read+0x59/0x10d=
0
>  #1: ffff88811ec25fd8 (sk_lock-AF_UNIX){+.+.}-{0:0}, at: bpf_seq_read+0x4=
2c/0x10d0
>  #2: ffff88811ec25f58 (slock-AF_UNIX){+...}-{3:3}, at: __lock_sock_fast+0=
x37/0xe0
>  #3: ffffffff85a6a7c0 (rcu_read_lock){....}-{1:3}, at: bpf_iter_run_prog+=
0x51d/0xb00
>
> Call Trace:
>  dump_stack_lvl+0x5d/0x80
>  print_deadlock_bug.cold+0xc0/0xce
>  __lock_acquire+0x130f/0x2590
>  lock_acquire+0x14e/0x2b0
>  _raw_spin_lock+0x30/0x40
>  sock_map_update_elem+0xdb/0x1f0
>  bpf_prog_2d0075e5d9b721cd_dump_unix+0x55/0x4f4
>  bpf_iter_run_prog+0x5b9/0xb00
>  bpf_iter_unix_seq_show+0x1f7/0x2e0
>  bpf_seq_read+0x42c/0x10d0
>  vfs_read+0x171/0xb20
>  ksys_read+0xff/0x200
>  do_syscall_64+0x6b/0x3a0
>  entry_SYSCALL_64_after_hwframe+0x76/0x7e
>
> Suggested-by: Kuniyuki Iwashima <kuniyu@google.com>
> Suggested-by: Martin KaFai Lau <martin.lau@linux.dev>
> Fixes: 2c860a43dd77 ("bpf: af_unix: Implement BPF iterator for UNIX domai=
n socket.")
> Signed-off-by: Michal Luczaj <mhal@rbox.co>

Reviewed-by: Kuniyuki Iwashima <kuniyu@google.com>
