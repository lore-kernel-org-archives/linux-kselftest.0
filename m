Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78D1C11CBA
	for <linux-kselftest@vger.kernel.org>; Sat, 20 Jun 2026 01:53:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781920439; cv=none; b=iUmCIW5r2Egz32penavFCN2nfVdcjhohkVaUNhd6jWFKj+BYsTlJ9GgkkwXqtoqA7jOEfe71Kw2SwNFNrmPPQYJNNwvuXgL24kNB6Vfn+hOqg1F5KRkFabc5S/zuo7Ivw/6XtXe+312tq/RqG8pDBZqgFf2sOEsYk96HA+1jTEU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781920439; c=relaxed/simple;
	bh=mM7hNa2kfVQS0T/C1BMUgERGqTk4zdDV+theH4eUk1M=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=o2Qs3emyBPU9ZmwnvR7I/X/ONKlmNN6L2BTrCC0fWwGWD7wXTJWADs0210zve0iFLnx8LtK74IjKOKQmroboVAJyvrA9whYCdbkMXapWKE7r+Vg4fxdA1IpcrnQBhhCfdJ+M14ta8Bug62SU1/FIcyk+6ZJKkOlHGnJJ687D6So=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=l2+sEn9y; arc=none smtp.client-ip=209.85.215.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="l2+sEn9y"
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-c85d8615b09so1800929a12.3
        for <linux-kselftest@vger.kernel.org>; Fri, 19 Jun 2026 18:53:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781920438; x=1782525238; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=jywBCOj+R5S6acN/5CBd5A/rAfngCi91JbR/5wlEEho=;
        b=l2+sEn9y5swE+3Jt596e8avR6Ch9f6LafnGavwBhydNV71CWjShaZPlt3RSnU1zS7Q
         CIzrRJfICs2iCpKK3kh7BJrf4ZQynJZBkH54UpsM/5EYNa90wnLBmfQNx01XRN5Jc9K/
         w8l988AR/dPQP1jRTQMsfqlqY62tHNROIsqwfRt9aRw2S/0WdqTjph905n6crX1bg4j6
         HDZCYTr/Uq46Wtakleqt9WTakUkU0BpxnsJr4jAY6fiO6ptfn70i0k5jBhWR/CS6obO8
         a5HQtXe/d8xte7+zdpBpOF7OIra8Z7tU7AXUwVEeKUuOxmgmGwDjI+BxAKbLGHt65jt8
         X9TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781920438; x=1782525238;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jywBCOj+R5S6acN/5CBd5A/rAfngCi91JbR/5wlEEho=;
        b=lgP13RigLRCNFO7zKXc9s2A7Bd92I09v41AKcIK+Qn1CCS2xECWwXpQsLJm5BKQjiL
         7OE99ClSczUmbeHXq0QUq8LC2UeLnoa/DxZBaMz0CUCakOWkMhFfbE6+110rYdeeCWnB
         /xXC02DBEntSIjBfjUrHlwoFWQUud8dGCnjoPZi3vUmYhF7KZrvgpyYPbkJrVuA67eSh
         hRXoE8+95SlDY1QeumOehJ2lYQ4D6I5EPB6QGEKEUJCwSrGX0nW/U0MlTAUZoGz96oEw
         vLJo35VWVpCXY6a984Pc6Z9WhGXwE/c38MlhmjeGABfCJ3e2bRgA5Oq1INxPlqU5kv5N
         JRuw==
X-Forwarded-Encrypted: i=1; AFNElJ/RhFDZ+fqkXVrlgwAZ5hAhfJZ8zsmFnfdk/ahHWpRKskhapLh84z6liJ8E136AVPu6F49Mbkt6PgQRNrdXrXw=@vger.kernel.org
X-Gm-Message-State: AOJu0YwE7FqxBHAB9wcRGG1ZCSCtRwq5cSXVGumYlfCQbxuOgQLF4BDa
	URMGDOYgdg9AUdBp1TxnZaTYszD8heZv8dDEqH69Ag+RYHa600oISDLHDhZ72uexG9ggng==
X-Gm-Gg: AfdE7clgMyybziFzgfSajuGtH6T13Sk+OJJmNbW96uOqdkq2LEgFHvTtmYt5a5I8tqt
	UKkURqoYwWr5khvOYcxPpa/t8tGDl5fvmGUqSqjCodlxLkGwsuFKTQx8UfFz8JnYrfaC0jK4tEp
	1KXnL4lwed81Ajdc/rGQzmtqiZ3vxQDhRu+jAf2uIcxKo8jHc05Ra8pEqy2NHSesrueIlDkBVmr
	RpW4z9+Sz/xsJpFaIL6T6hrGqOSDdmH2fSZleUue5A1dvZQtDvMA8Mcy9VsADCHUEvBpLYF4eWm
	AGftBsevyZIR3AgRk9cOUVp+VS3VlI2PNvW81N2EpktFL0e+2NKAiRMaP0JamN9m5IygvPDcob0
	HNhoLbpy3H4+UyLRHNNOyICBALqPSzRfTumpyLy7R7Qw/UjvXu9Bi9/ZXonW8vhXMuDMgJzJZ36
	7OgyNnzRZxskIt72OqXxIaVpec0H+LhhI8SJnHDx10gA==
X-Received: by 2002:a05:6a20:3ca6:b0:3a2:dd8a:5084 with SMTP id adf61e73a8af0-3bb3424481emr7229934637.37.1781920437716;
        Fri, 19 Jun 2026 18:53:57 -0700 (PDT)
Received: from [192.168.0.226] ([38.34.87.7])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c8bc2c8d8a9sm925283a12.5.2026.06.19.18.53.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Jun 2026 18:53:57 -0700 (PDT)
Message-ID: <be221942819c7654f054b53907fe9ff2e9526f79.camel@gmail.com>
Subject: Re: [PATCH bpf v2 8/8] libbpf: ringbuf: Prevent missed wakeups
From: Eduard Zingerman <eddyz87@gmail.com>
To: Tamir Duberstein <tamird@kernel.org>, Alexei Starovoitov
 <ast@kernel.org>,  Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko
 <andrii@kernel.org>, Martin KaFai Lau <martin.lau@linux.dev>,  Kumar
 Kartikeya Dwivedi	 <memxor@gmail.com>, Song Liu <song@kernel.org>, Yonghong
 Song	 <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, Shuah Khan	
 <shuah@kernel.org>, Andrea Righi <arighi@nvidia.com>, Xu Kuohai	
 <xukuohai@huawei.com>, Andrea Righi <andrea.righi@canonical.com>,
 Bing-Jhong Billy Jheng <billy@starlabs.sg>, David Vernet
 <void@manifault.com>
Cc: bpf@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, Andrew Werner <awerner32@gmail.com>, Zvi
 Effron	 <zeffron@riotgames.com>, Andrii Nakryiko <andriin@fb.com>, Emil
 Tsalapatis	 <emil@etsalapatis.com>, Sashiko <sashiko-bot@kernel.org>
Date: Fri, 19 Jun 2026 18:53:54 -0700
In-Reply-To: <20260618-bpf-ringbuf-fixes-v2-8-33fde039ddf3@kernel.org>
References: <20260618-bpf-ringbuf-fixes-v2-0-33fde039ddf3@kernel.org>
	 <20260618-bpf-ringbuf-fixes-v2-8-33fde039ddf3@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.60.1 (3.60.1-1.fc44) 
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Thu, 2026-06-18 at 20:26 -0400, Tamir Duberstein wrote:
> After consuming the last visible record, ringbuf_process_ring()
> publishes the consumer position and checks the producer position. These
> operations lack a full StoreLoad barrier. A producer can therefore
> commit a new record but read the old consumer position while the
> consumer reads the old producer position. The producer sends no
> notification and the consumer waits despite a queued record.
>=20
> Insert a full barrier between publishing a consumer position and the
> next producer position load. When a record bound or callback ends the
> current invocation first, execute the barrier before returning so the
> load in a later invocation completes the same handshake.
>=20
> Add an edge-triggered epoll test that drains one record per call while a
> concurrent producer fills the ring. Without the barrier, a missed
> notification leaves the producer dropping records from a full ring while
> the consumer times out. Document that bounded consumers and callbacks
> that terminate consumption must drain before waiting again.
>=20
> Fixes: bf99c936f947 ("libbpf: Add BPF ring buffer support")
> Reported-by: Andrew Werner <awerner32@gmail.com>
> Reported-by: Sashiko <sashiko-bot@kernel.org>
> Closes: https://lore.kernel.org/bpf/20260614015716.945AF1F000E9@smtp.kern=
el.org/
> Assisted-by: Codex:gpt-5.5
> Signed-off-by: Tamir Duberstein <tamird@kernel.org>
> ---

Took me a while, but I agree there is a race here.
FWIW, here is the description of the race as far as I understand it.

Simplified pseudo-code for the consumer (ringbuf_process_ring)

    cons_pos =3D load_acquire(consumer_pos);      // op#1 [orders before 2,=
3,4,5]
    do {
      got_new_data =3D false;
      prod_pos =3D load_acquire(producer_pos);    // op#2 [orders before 3,=
4,5]
      while (cons_pos < prod_pos) {
        len_ptr =3D ... cons_pos ...;
        len =3D load_acquire(len_ptr);            // op#3 [orders before 4,=
5]
        got_new_data =3D true;
        callback(... cons_pos ...);             // op#4
        cons_pos +=3D len;
        store_release(consumer_pos, cons_pos);  // op#5 [orders after 2,3,4=
; ordering relative to 2' not defined]
      }
    } while (got_new_data);

  The patch fixes the issue with op#5, store_release operation is
  ordered after operations 2,3,4, but it's ordering relative to op#2
  from the next outer loop iteration (denoted as 2') is not defined.

Simplified pseudo-code for the producer (bpf_ringbuf_{reserve,commit})

    // reserve
    store_release(producer_pos, ...);

    // commit
    xchg(... clear BUSY_BIT ...);
    cons_pos =3D load_acquire(consumer_pos);
    if (cons_pos =3D=3D rec_pos)
        schedule_wakeup();

A possible sequence of events

  Producer:

    // submits a record such that:
    consumer_pos =3D 0   (initial state)
    producer_pos =3D 10

  Consumer:

    cons_pos =3D load_acquire(consumer_pos)     -> cons_pos =3D 0
    prod_pos =3D load_acquire(producer_pos)     -> prod_pos =3D 10
      len =3D load_acquire(len_ptr)             -> len =3D 10
      callback(...)                           -> (record at pos 0 consumed)
      cons_pos +=3D len                         -> cons_pos =3D 10
      store_release(consumer_pos, cons_pos)   -> consumer_pos =3D 10   (iss=
ued; global visibility deferred)
      (cons_pos < prod_pos) 10 < 10           -> false, exit inner loop
    while (got_new_data)                      -> true, re-enter outer loop
    prod_pos =3D load_acquire(producer_pos)     -> prod_pos =3D 10       (r=
eads current value; record at pos 10 not published yet)
      (cons_pos < prod_pos) 10 < 10           -> false, skip inner loop
    while (got_new_data)                      -> false; consumer returns 0 =
and enters an epoll wait

  Producer (reserves and submits a new record):

    store_release(producer_pos, 20)           -> producer_pos =3D 20   (rec=
ord at pos 10 reserved)
    xchg(... clear BUSY_BIT ...)              -> (record at pos 10 committe=
d)
    cons_pos =3D load_acquire(consumer_pos)     -> cons_pos =3D 0        (c=
onsumer's store of 10 not visible yet)
      rec_pos =3D 10; cons_pos =3D=3D rec_pos       -> 0 =3D=3D 10 false ->=
 NO WAKEUP

  Consumer:

    (deferred store becomes visible)          -> consumer_pos =3D 10   (too=
 late)

---

Consumer exits while a new record is available in the buffer,
and the producer fails to notify the consumer via epoll.
The added barrier prevents such sequence of events.

For the fix:

Reviewed-by: Eduard Zingerman <eddyz87@gmail.com>

Please move the test to a separate commit, I'll review it a bit later.

[...]
