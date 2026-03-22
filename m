Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25F4B2ED84C
	for <linux-kselftest@vger.kernel.org>; Sun, 22 Mar 2026 01:20:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774142443; cv=none; b=GIjapfdwCt8krjVACt3vGhyNHeoc7DybjO0YwDsnQ9p+gGA6ZUIOnjOfvMB++8hZY18eBWNQyopdJ5Tnc5un5yz+TNF8UqM4cZOqwEeYICWi1UxyXaZOP4lLIRyf+tRpQXBbHeAqQsG3qiDLpqYVwlM5JHwaLkhJK+tSqL0MfPQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774142443; c=relaxed/simple;
	bh=YC7qUvr1E4ECRZ6uECeSY381mj4OkAUb+a4ih53vA8A=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=FGbPFvw6mYMKCw9hNzF45XaZEuzRXQgv/ZIrBkUeAAJBb4hnr/XxRnCx1FU6Monnt2XXv6ndsUzndd2uU/AASf9XZbpR54XXGEobQbS1uEMIDSPnr+HDL9X1o7dFdmb/O4cBvuizh/c17ljTuG2ngLmSlQBFS24KVbzdVTwbKPQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=etsalapatis.com; spf=pass smtp.mailfrom=etsalapatis.com; dkim=pass (2048-bit key) header.d=etsalapatis-com.20230601.gappssmtp.com header.i=@etsalapatis-com.20230601.gappssmtp.com header.b=11DtnhF1; arc=none smtp.client-ip=209.85.160.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=etsalapatis.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=etsalapatis.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=etsalapatis-com.20230601.gappssmtp.com header.i=@etsalapatis-com.20230601.gappssmtp.com header.b="11DtnhF1"
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-50b2b2aa276so23972191cf.3
        for <linux-kselftest@vger.kernel.org>; Sat, 21 Mar 2026 18:20:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=etsalapatis-com.20230601.gappssmtp.com; s=20230601; t=1774142440; x=1774747240; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=D2lYegb3d1WlAShOCbB85z2jt2u6c/ceLqqA07OncCc=;
        b=11DtnhF1ixQ+H7b/48zMaeNtR4DqdGo4QkLQ3T45oZ3RVV7C0Gusx4Chz7+uX+eKvj
         PAwb8qY0exECiYEEcGieYuwD8StM5QJckeBUkzf89irj71vHi1uQG/LGT7IMZe0AZOkB
         40B87I+WsQe7MfJPQUxSJJEyargUkfPMlrA/l53TlyXiv4X4JF1IhuWun9MI+oX0jliq
         VtTCZYmN19VOzFkG0x31gLNeJ0sHrrA5izJ1vErk/jvyp20Z46AgfGBAyTO5umSzaoaN
         qVEeKsQ7ihDpJccs4riY2vABEKU8dzzaC85CKygSRfAFeLrC+gSqcxwojUJy/3Pzvff9
         i9yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774142440; x=1774747240;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=D2lYegb3d1WlAShOCbB85z2jt2u6c/ceLqqA07OncCc=;
        b=KuByeAcnk/H108wWn/6vaniVYOsMSCv17KntDS8qdteuaCFx0YJoJxEqUntEepRo12
         E/TC6BWbNhT2yZKd/V5VVjq3HWjuNy4c2s98PpyWYzMlJMe3JQtwYJtaOmVhifAcvOHu
         fPV90ubd+C7aAcISxsND4h4h9tJvjw3KJwZBquime7Fd43xUycvXo3EmQuAiraRQ5P9M
         mB7DPhvI48TYlxMIInFp46Y3wZqwAoCqNusDH99TdMz/HzcuQybuZuY2rUwpZd3fMkHK
         M+sUrZo9BWh83GHCOCy4bwI9iLf7dFxzsmH3zVSt6uxjVrK9wiG4LkYrxXN+fqiDtwpF
         wu7g==
X-Forwarded-Encrypted: i=1; AJvYcCWu4PZMEHJP2TOk9KTArXD1nZmRO4DAugIM5zVuO4z9keymVrojuFUdv9hPEXbyC6c7GId0gym9rlVhGTlNdYw=@vger.kernel.org
X-Gm-Message-State: AOJu0YziYiA8GgHYpd4zaskCGX1G0mhXLd3My0AMQ7RjbNQr5agk+TRa
	iprdLAvg50zbE/rgzsj9+bUl2KiVyHSoROuqEdpognQy5myMUKNoZapTt3OfE4M5mDg=
X-Gm-Gg: ATEYQzyyl4tX4K4fY537CtDhgRVTi67HKCh94Nm1b3JARidjMn3DtmpiL5dwQxQifIT
	8WRzwPf+l1pFvD7FMoO5rQL/VTkc3VSFwE+Fmxg4D3SdLoPOuOJrvzXkRABZxODYMNPy8N2GM8u
	eDexx809+v8p3sNXb23NbstKdoDY6hSGtlsMpBvA7z/bY/v2O9NyJmaFm1xebGyAZYPlOmbl8/8
	3ERyRm4mJAJjr6quT7LZFZrRqmY6Kf4OwsUpQS8tlpQZPPzP1EVN8d5XoGYOhhO03/QzmF3Dno/
	N9kqaov0Xgz5c64pQkCIvupWnaWKXHAt68iRq4m/U7l1uR+lCJJwKVBIxKGtwVsReFo1/f6RuK7
	TR1HqKvUyqEtfuzkCZVybONkCjrJUvjaN969kexfLWUuIeW+zrjGGv0niL59sLkFpgd2RhyrIe0
	gIbvRQ7BYrbxEj+GkI26ImomsGa+qzSgt62w==
X-Received: by 2002:a05:622a:6097:b0:509:1ee2:69e4 with SMTP id d75a77b69052e-50b3739fe9fmr124931621cf.11.1774142439962;
        Sat, 21 Mar 2026 18:20:39 -0700 (PDT)
Received: from localhost ([140.174.219.137])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-50b36eb54cfsm53223781cf.30.2026.03.21.18.20.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 21 Mar 2026 18:20:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 21 Mar 2026 21:20:37 -0400
Message-Id: <DH8X08EB6T7J.2IA6WKFSZ8XGF@etsalapatis.com>
Cc: <bpf@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH bpf-next v8 7/8] bpf: add bpf_list_is_first/last/empty
 kfuncs
From: "Emil Tsalapatis" <emil@etsalapatis.com>
To: "Emil Tsalapatis" <emil@etsalapatis.com>, "Chengkaitao"
 <pilgrimtao@gmail.com>, <martin.lau@linux.dev>, <ast@kernel.org>,
 <daniel@iogearbox.net>, <andrii@kernel.org>, <eddyz87@gmail.com>,
 <song@kernel.org>, <yonghong.song@linux.dev>, <john.fastabend@gmail.com>,
 <kpsingh@kernel.org>, <sdf@fomichev.me>, <haoluo@google.com>,
 <jolsa@kernel.org>, <shuah@kernel.org>, <chengkaitao@kylinos.cn>,
 <linux-kselftest@vger.kernel.org>
X-Mailer: aerc 0.20.1
References: <20260316112843.78657-1-pilgrimtao@gmail.com>
 <20260316112843.78657-8-pilgrimtao@gmail.com>
 <DH8WLC5587BJ.30X22578QBN3C@etsalapatis.com>
In-Reply-To: <DH8WLC5587BJ.30X22578QBN3C@etsalapatis.com>

On Sat Mar 21, 2026 at 9:01 PM EDT, Emil Tsalapatis wrote:
> On Mon Mar 16, 2026 at 7:28 AM EDT, Chengkaitao wrote:
>> From: Kaitao Cheng <chengkaitao@kylinos.cn>
>>
>> Add three kfuncs for BPF linked list queries:
>> - bpf_list_is_first(head, node): true if node is the first in the list.
>> - bpf_list_is_last(head, node): true if node is the last in the list.
>> - bpf_list_empty(head): true if the list has no entries.
>>
>> Currently, without these kfuncs, to implement the above functionality
>> it is necessary to first call bpf_list_pop_front/back to retrieve the
>> first or last node before checking whether the passed-in node was the
>> first or last one. After the check, the node had to be pushed back into
>> the list using bpf_list_push_front/back, which was very inefficient.
>>
>> Now, with the bpf_list_is_first/last/empty kfuncs, we can directly
>> check whether a node is the first, last, or whether the list is empty,
>> without having to first retrieve the node.
>
> Do you need to expand the exceptions you added in patch 5 for non-owning
> reference arguments to also hold for this? Checking the selftests, we
> don't have one where either bpf_list_is_last or bpf_list_is_first
> return true, can you add one?
>

I misread the selftests, my bad. The tests pass fine, and we just have
to keep an owning reference of the nodes around to pass to the helpers.

Reviewed-by: Emil Tsalapatis <emil@etsalapatis.com>

>>
>> Signed-off-by: Kaitao Cheng <chengkaitao@kylinos.cn>
>> ---
>>  kernel/bpf/helpers.c  | 38 ++++++++++++++++++++++++++++++++++++++
>>  kernel/bpf/verifier.c | 11 +++++++++++
>>  2 files changed, 49 insertions(+)
>>
>> diff --git a/kernel/bpf/helpers.c b/kernel/bpf/helpers.c
>> index dc4f8b4eec01..da70dcff4ba8 100644
>> --- a/kernel/bpf/helpers.c
>> +++ b/kernel/bpf/helpers.c
>> @@ -2518,6 +2518,41 @@ __bpf_kfunc struct bpf_list_node *bpf_list_back(s=
truct bpf_list_head *head)
>>  	return (struct bpf_list_node *)h->prev;
>>  }
>> =20
>> +__bpf_kfunc bool bpf_list_is_first(struct bpf_list_head *head, struct b=
pf_list_node *node)
>> +{
>> +	struct list_head *h =3D (struct list_head *)head;
>> +	struct bpf_list_node_kern *kn =3D (struct bpf_list_node_kern *)node;
>> +
>> +	if (READ_ONCE(kn->owner) !=3D head)
>> +		return false;
>> +
>> +	return list_is_first(&kn->list_head, h);
>> +}
>> +
>> +__bpf_kfunc bool bpf_list_is_last(struct bpf_list_head *head, struct bp=
f_list_node *node)
>> +{
>> +	struct list_head *h =3D (struct list_head *)head;
>> +	struct bpf_list_node_kern *kn =3D (struct bpf_list_node_kern *)node;
>> +
>> +	if (READ_ONCE(kn->owner) !=3D head)
>> +		return false;
>> +
>> +	return list_is_last(&kn->list_head, h);
>> +}
>> +
>> +__bpf_kfunc bool bpf_list_empty(struct bpf_list_head *head)
>> +{
>> +	struct list_head *h =3D (struct list_head *)head;
>> +
>> +	/* If list_head was 0-initialized by map, bpf_obj_init_field wasn't
>> +	 * called on its fields, so init here
>> +	 */
>> +	if (unlikely(!h->next))
>> +		INIT_LIST_HEAD(h);
>> +
>> +	return list_empty(h);
>> +}
>> +
>>  __bpf_kfunc struct bpf_rb_node *bpf_rbtree_remove(struct bpf_rb_root *r=
oot,
>>  						  struct bpf_rb_node *node)
>>  {
>> @@ -4588,6 +4623,9 @@ BTF_ID_FLAGS(func, bpf_list_del, KF_ACQUIRE | KF_R=
ET_NULL)
>>  BTF_ID_FLAGS(func, bpf_list_front, KF_RET_NULL)
>>  BTF_ID_FLAGS(func, bpf_list_back, KF_RET_NULL)
>>  BTF_ID_FLAGS(func, bpf_list_add_impl)
>> +BTF_ID_FLAGS(func, bpf_list_is_first)
>> +BTF_ID_FLAGS(func, bpf_list_is_last)
>> +BTF_ID_FLAGS(func, bpf_list_empty)
>>  BTF_ID_FLAGS(func, bpf_task_acquire, KF_ACQUIRE | KF_RCU | KF_RET_NULL)
>>  BTF_ID_FLAGS(func, bpf_task_release, KF_RELEASE)
>>  BTF_ID_FLAGS(func, bpf_rbtree_remove, KF_ACQUIRE | KF_RET_NULL)
>> diff --git a/kernel/bpf/verifier.c b/kernel/bpf/verifier.c
>> index 0a6f2e6a5d28..c2cc622bb3a1 100644
>> --- a/kernel/bpf/verifier.c
>> +++ b/kernel/bpf/verifier.c
>> @@ -12512,6 +12512,9 @@ enum special_kfunc_type {
>>  	KF_bpf_list_del,
>>  	KF_bpf_list_front,
>>  	KF_bpf_list_back,
>> +	KF_bpf_list_is_first,
>> +	KF_bpf_list_is_last,
>> +	KF_bpf_list_empty,
>>  	KF_bpf_cast_to_kern_ctx,
>>  	KF_bpf_rdonly_cast,
>>  	KF_bpf_rcu_read_lock,
>> @@ -12574,6 +12577,9 @@ BTF_ID(func, bpf_list_pop_back)
>>  BTF_ID(func, bpf_list_del)
>>  BTF_ID(func, bpf_list_front)
>>  BTF_ID(func, bpf_list_back)
>> +BTF_ID(func, bpf_list_is_first)
>> +BTF_ID(func, bpf_list_is_last)
>> +BTF_ID(func, bpf_list_empty)
>>  BTF_ID(func, bpf_cast_to_kern_ctx)
>>  BTF_ID(func, bpf_rdonly_cast)
>>  BTF_ID(func, bpf_rcu_read_lock)
>> @@ -12652,6 +12658,9 @@ static const enum special_kfunc_type bpf_list_ap=
i_kfuncs[] =3D {
>>  	KF_bpf_list_del,
>>  	KF_bpf_list_front,
>>  	KF_bpf_list_back,
>> +	KF_bpf_list_is_first,
>> +	KF_bpf_list_is_last,
>> +	KF_bpf_list_empty,
>>  };
>> =20
>>  /* Kfuncs that take a list node argument (bpf_list_node *). */
>> @@ -12660,6 +12669,8 @@ static const enum special_kfunc_type bpf_list_no=
de_api_kfuncs[] =3D {
>>  	KF_bpf_list_push_back_impl,
>>  	KF_bpf_list_add_impl,
>>  	KF_bpf_list_del,
>> +	KF_bpf_list_is_first,
>> +	KF_bpf_list_is_last,
>>  };
>> =20
>>  /* Kfuncs that take an rbtree node argument (bpf_rb_node *). */

