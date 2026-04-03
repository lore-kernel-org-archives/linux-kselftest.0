Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71378346FA6
	for <linux-kselftest@vger.kernel.org>; Fri,  3 Apr 2026 02:26:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.175
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775183208; cv=pass; b=NT/FMb4e18GhVSdNavf/XO5NMCOJLs0rTqZwsoNzlvSI+3IXeLNRmhkDJZ2LvMyilm80OIY8aouOwuvDvcFoToIGORGB/nQVeHHtW3BqmYiRTDu+iLC2hV0NEqpkiXuFyC1KuyMMJW95T8+MHFj0Ym18Oqi535t53RNRnw/S2NQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775183208; c=relaxed/simple;
	bh=vcJVYVcsjtujJhxPM2Hmf6GUicBFUB6Kawjcdbn0m+k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AlvWBwNXuNxsiJYcYu0+LYUoiqI2IfT+//hDj0JZpekoWZ8A9XKTzYQiQWY7MKB76Q9TN97uu/coZZvqSfp2nsompxtlPZrrZODeDOzAlfA7Qh/qAZXWuwKcZyLL8fuJKZx2IlfgsGOYVNdOfQa1X1QzaKvMrdB2Ub6oGXXZ7Ts=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=pj9APJiX; arc=pass smtp.client-ip=209.85.128.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="pj9APJiX"
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-7991db3dc98so17016547b3.0
        for <linux-kselftest@vger.kernel.org>; Thu, 02 Apr 2026 19:26:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775183206; cv=none;
        d=google.com; s=arc-20240605;
        b=ha273rQpDcyEF9fg2W/6a1QIPDeSi6pGLAK8m/YpE/jqKYX9xQpkg11NYFnco0SRrD
         gcYxiLKYsWcMEshy1Cn8rKAbrqk79LVp9JETvII6m5jfjEIcwr8+iVhEUay7Fa9MesiQ
         T37Z11+zHjaUeB9bEh2DQTfUnZ6/pQAbEdVT/zeJYu4UwdmboolsaAxMdjz6BaupBpUV
         HB4pueFsVxCbxnlC8/Yk55ymNIvP9pznPF4tl4Jhkr1OVnHwSM/5PmclqmUnOnYar6Cb
         BmSt2szetwnQl5xO6q0laI9oi1PoKZXmwlosuL068i8lB0mSyO+Twt4lHcJxATS3guBo
         GKWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=oDMKzHqeL/XyiO2Bewz0UeWrM+1zjaTUFq6LPDrd+SI=;
        fh=gDZVIVtxi5L3J7KRHbN8goqFk7Q11gjbpH9UIlmV4cg=;
        b=A5udgUgQdTVIATh/OqD8I1UpMk2Wz201VjxhiwVnxfQrGeE9AVFLrwwNMVrFqDnDdL
         W7tYhhsAs06oUuna4RSYUVapDn8VlrY8vVYPTWwbamUB2w55MwbQQ1gEGq04RokQP5OC
         QN/W4OJCsoacBEQRfa1aza+BCWXk+DdukCsi6KrGbfnLMa4v9GXjKwOFHNhdI4p93LXe
         APW2EiG59U8SYsTC/P5Var/efkLYog9LZFlmOUpMX+BLKN+Vb+ZcrJj/XHC/4NyaIppC
         xHpeFt0S8rUX7XDcDElDdWurfsofjKEQrgMrHLTeX4mrAr/IG8lUk/XxX9xm/tJegYl8
         EQxg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1775183206; x=1775788006; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oDMKzHqeL/XyiO2Bewz0UeWrM+1zjaTUFq6LPDrd+SI=;
        b=pj9APJiXwPQpv2w/t6G6RTFnZEOcQthmzNUT0gh9/PMgPwKu0cOD8de4u4xK8MFJG8
         rh5op5ZoOQFvio0wkCcf4oeMdLGXICbgT0ECbrVKn9uZwhLNNVYPQwgL24ik/wPbdw/n
         u5KFOb+Tuizym1/1P+Di0L2Wwr5/HOANx9ZcMLCy5hDIEkFgBImB8ZQjW4sw1rsUWTh+
         ByWNE7yg5BohdHOxBKMA0nSisf1YKIzKOw0bKPmn6LqpQctIK5vy7s2NhKCslkRlkNEY
         zv+sYPBO1mzQuJNfw9rfaEIuFv6AuqLwyelA3QR4mlS0VGVbYGY9eIxKBaE6y/k5acem
         nkfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775183206; x=1775788006;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=oDMKzHqeL/XyiO2Bewz0UeWrM+1zjaTUFq6LPDrd+SI=;
        b=nMtzkDucnoe9FfVUxRK8gLaaMC0LI3Np1IkuN7Tf8t+aFIM2rCYUBmWbYzNn/UXDHy
         9LTZplOc/anVkRtLaAndCGsOa1SJKQcY1s3ylpAfuZvU8numZ9T9cG8CwlhYJKESYvqr
         CjvhxnNaofPUEHo8ZuAIrRluEUJWPDVQL0Oeof64lHKsajbXc9ybLDQKdBv0BGN29YGE
         Qeiqk+6TazGdSdfsrdL2M3kuXIJT6jHMiaiiWq130VBSOI8JAeEbQQAvg96WhmGZFkpd
         Jas7IclRK5WS43P0jfoTWq179WISqUg1J0BC0UHOzAJeSoXq+zoN/lJuvq2EvDAW9o76
         lkfQ==
X-Forwarded-Encrypted: i=1; AJvYcCUH/KQKtsJpTWLOzN+v7HQI+BcR+X/SVerM6HQx+jO6Rsyq2YKhnLxVbcaCHgW40IMjP7YkLc8SyrpbRJsrw1E=@vger.kernel.org
X-Gm-Message-State: AOJu0YzMtBcXk4MKYn7J8DTEO8z5qz8B2hWRkjJ5cUefNWEuYTEFNPTc
	ESPVlvzBe48svut4lSxGSk9Ob5E6ZsAq1MotyLtejM053qSTx0VOCuzWtzBoGmXCKQbgX8GcjXN
	o+C6k50P9Yv8RUSIirci1Qr+OeURlrX92ArxXnMJs
X-Gm-Gg: AeBDiesf/yoCVoxkehJLLvn58IU6c88RnMp9Y0eEeRHruVi2B5Pjl1mkaPCjEWpVcWB
	Ng1GycNRWdKK473D7cCAuTYdffeEv/8cRk46TFcVX1g8FfhoFo0hA19Lk5hk7abOw9RtJMdw3/q
	ymyLHSW1jDhr2Y6fOIxGBVxARP2IqXLtQZ7VMDoIlccNQ0NSkQYmFoYsuyStR1wUSS/vbIj4xpA
	VlPt1NGCVQYEPlSm3CQbBsEnHQorObROUMjTOLhDy2Ms5cTAGtWM/XIBjrsr8i5V+GgfMe11uWW
	8rTrneMwyqQAUeprUg==
X-Received: by 2002:a05:690c:90:b0:79a:c396:c01 with SMTP id
 00721157ae682-7a4d6732758mr17280927b3.55.1775183206003; Thu, 02 Apr 2026
 19:26:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260403015851.148209-1-jiayuan.chen@linux.dev> <20260403015851.148209-2-jiayuan.chen@linux.dev>
In-Reply-To: <20260403015851.148209-2-jiayuan.chen@linux.dev>
From: Eric Dumazet <edumazet@google.com>
Date: Thu, 2 Apr 2026 19:26:34 -0700
X-Gm-Features: AQROBzAh2Ysi0SF15X8q_e3XfU4X2ZmmJIBBcIrVoyrG5eWnijGl8DAlrd1gYkE
Message-ID: <CANn89i+1VzG3KSv1NvhTbPm2EdG4Lvii256yZj_wq9jcB-qQ0A@mail.gmail.com>
Subject: Re: [PATCH bpf v6 1/2] bpf: tcp: Reject non-TCP skb in bpf_sk_assign_tcp_reqsk()
To: Jiayuan Chen <jiayuan.chen@linux.dev>
Cc: bpf@vger.kernel.org, Kuniyuki Iwashima <kuniyu@google.com>, 
	Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Andrii Nakryiko <andrii@kernel.org>, Martin KaFai Lau <martin.lau@linux.dev>, 
	Eduard Zingerman <eddyz87@gmail.com>, Kumar Kartikeya Dwivedi <memxor@gmail.com>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, 
	John Fastabend <john.fastabend@gmail.com>, Stanislav Fomichev <sdf@fomichev.me>, 
	"David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Simon Horman <horms@kernel.org>, Shuah Khan <shuah@kernel.org>, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 2, 2026 at 6:59=E2=80=AFPM Jiayuan Chen <jiayuan.chen@linux.dev=
> wrote:
>
> bpf_sk_assign_tcp_reqsk() only validates skb->protocol (L3) but does not
> check the L4 protocol in the IP header. A BPF program can call this kfunc
> on a UDP skb with a valid TCP listener socket, which will succeed and
> attach a TCP reqsk to the UDP skb.
>
> When the UDP skb enters the UDP receive path, skb_steal_sock() returns
> the TCP listener from the reqsk. The UDP code then passes this TCP socket
> to udp_unicast_rcv_skb() -> __udp_enqueue_schedule_skb(), which casts
> it to udp_sock and accesses UDP-specific fields at invalid offsets,
> causing a null pointer dereference and kernel panic:
>
>   BUG: KASAN: null-ptr-deref in __udp_enqueue_schedule_skb+0x19d/0x1df0
>   Read of size 4 at addr 0000000000000008 by task test_progs/537


>
> Fix this by checking the IP header's protocol field in
> bpf_sk_assign_tcp_reqsk() and rejecting non-TCP skbs with -EINVAL.
>
> Note that for IPv6, the nexthdr check does not walk extension headers.
> This is uncommon for TCP SYN packets in practice, and keeping it simple
> was agreed upon by Kuniyuki Iwashima.
>
> Fixes: e472f88891ab ("bpf: tcp: Support arbitrary SYN Cookie.")
> Reviewed-by: Kuniyuki Iwashima <kuniyu@google.com>
> Signed-off-by: Jiayuan Chen <jiayuan.chen@linux.dev>

Reviewed-by: Eric Dumazet <edumazet@google.com>
