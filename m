Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F817224B1E
	for <linux-kselftest@vger.kernel.org>; Sun, 22 Mar 2026 00:45:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774140308; cv=none; b=Dbt3+x5E3g5QQw96lMT3PgPe+EgotbzhZxph2UAInjQqE1O12LNAST4O7nbFTRQquoIU0TQe2UW7WaqnyVF0DTn632sPmDVqyykrYalKm0zuME7p/GyY3hsP0x0Xi9tnX3lGfKuksjfMyefPT9nDQr3sPiT9PetJTmIPyton36Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774140308; c=relaxed/simple;
	bh=oW4mYUz+jXj7OkLf9uZLF7gFI7iw8sov9pc50u8Z+7U=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=IhwOMnNKOCG9keDgs19VmzK1PYBEmd3JIXnzJVIS7AD8o+ihqOibYfdgs2sn2KSL1LJwbvEVKMUQSNzVkt5547+gzWDpYlnKVcnkyQunbPn7kOAIxK3b6bbqFtaUiuhp2kYdD7XvwdL4jpmDQn4eLZ/QYEvXT3oeyg30tjG5bXo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=etsalapatis.com; spf=pass smtp.mailfrom=etsalapatis.com; dkim=pass (2048-bit key) header.d=etsalapatis-com.20230601.gappssmtp.com header.i=@etsalapatis-com.20230601.gappssmtp.com header.b=ai+q8ie8; arc=none smtp.client-ip=209.85.219.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=etsalapatis.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=etsalapatis.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=etsalapatis-com.20230601.gappssmtp.com header.i=@etsalapatis-com.20230601.gappssmtp.com header.b="ai+q8ie8"
Received: by mail-qv1-f47.google.com with SMTP id 6a1803df08f44-89c52db6231so35819936d6.3
        for <linux-kselftest@vger.kernel.org>; Sat, 21 Mar 2026 17:45:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=etsalapatis-com.20230601.gappssmtp.com; s=20230601; t=1774140305; x=1774745105; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ub6j//PDVplmP1015QItMkzgMkrEL2KZLlzU1ilcsRs=;
        b=ai+q8ie8fw+NKa2WVFyeCsNsmZd67CvFc8zDhaTWwy/rdOaKL2sO5lCvWyKpCWq2BS
         wRN5nss0b/TNREe0Nr5zNW9nR3iM8o0k1z55z73siLQE6+n9OiNIZQ4Ejxs/d9Js8wEN
         W0KBcp6NpbPjxxN1ZKyqoZvJzbapG6CxnNg3h/EXpmNUS8U5zG/+5/nlp0lBQkZMWhSn
         jGruhNIOMexka53hhU96NoqByFbtP068B5fUFfmX1xFdRDXuvILySS/BygDzXbbSWkdT
         kjBerI2ra4Ny81kMaoFJ22aGPRu7c9uIYG2Ire4gRCbWxFrWzcSBGn5qp9fYbxWXOAE3
         UXHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774140305; x=1774745105;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ub6j//PDVplmP1015QItMkzgMkrEL2KZLlzU1ilcsRs=;
        b=VMF9SNClrCqqYJEGPYbUYLZGPb7/h5D5CLk+kynYWx4dkJG/kVrAAjEUEmrjDeJ4TZ
         mRaGkfo2lX1xyEtROSpM55sgr2UgqE4+uhZvy1VvbgxpR1vLCe/xlqvMwHybtax4Rrce
         5iCo9rg4s0FNZ4VL3BZHLRv5JV/O4wGLId/9QwN9GS+/Smc4d0dv42wHRX+vtNTw6amD
         zTViIDeENgbo4cfeMCw6uq4pWDY4Ed753UyygbRxMoan75oy1EGhVAdB8hV6Gjh1ONKQ
         Ny0z3uF03bnZEIYykHE6wMhq4+W5uWlvaBMkuwGkGedRgOekz69UXciiHW5fZ2y0a8UX
         U6DA==
X-Forwarded-Encrypted: i=1; AJvYcCUgQSGLyLDc6ttdFsU0SuSmXYyGzRUVockk8lvhvv7xvgCb7VrWml0ORvjwlYVnGEqVGeIqF52RBnCUX/PuTTY=@vger.kernel.org
X-Gm-Message-State: AOJu0YxUFu9630xU5XSRrfK0DsU4QS6geq8uUJQsjTczNpTZ1bXM55zg
	7YaejIypmlHUY/s3CRa7WY4VySRwek0cTluhvDu9sKQZQWbmFUkiSWRYXb0V/etzCzY=
X-Gm-Gg: ATEYQzxe4Ekuud+AmMAFDU4v0nfNGVTPRrjlezE7VzwhAXhQGHRZMJUjvDi3lpv6uin
	trQaK8goSdp9hIHPfloouKw2nfz+AkUvXlmVu+8gtoS5hEAv3sMTggyuoaKQ6KzpQwCh6RobFOl
	g9VUyqpOrg+fH2uTn7sBuuCnd8eMnAdeUmTB9ZBTjXkfVpR5ATQwz+/DcIIvn7YdTRt1mOzXM95
	qD0ES/NLGbJQbel96Y/1Ia/OK/HiX/+NOfXbZHmUPwYsyJitBCZGwBUFmJw+UPhJ8UI2ER8WMQ1
	Mh5aHVClgbxZsH5z4qBE3HOjRqx2e741u5qN5A+u3clGiBFNyhSSusA9SXpRhcrFl/BaSBMEnr1
	yh58TwYjLP7gfPdlBqv0W3+45UnaC1xjBCCIgSHjqk64MLsRDOTm3C7Ih0NJDMAxDIt7xfx9H9Z
	3+HYCh+d5x5SARbTewZ9aPotk=
X-Received: by 2002:ad4:5968:0:b0:89a:110f:8946 with SMTP id 6a1803df08f44-89c859b5280mr136052986d6.13.1774140304947;
        Sat, 21 Mar 2026 17:45:04 -0700 (PDT)
Received: from localhost ([140.174.219.137])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-89c85233ea6sm53211956d6.11.2026.03.21.17.45.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 21 Mar 2026 17:45:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 21 Mar 2026 20:45:02 -0400
Message-Id: <DH8W8ZEUIS2V.3DKINRTO292U2@etsalapatis.com>
Cc: <bpf@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH bpf-next v8 5/8] bpf: Add bpf_list_add_impl to insert
 node after a given list node
From: "Emil Tsalapatis" <emil@etsalapatis.com>
To: "Chengkaitao" <pilgrimtao@gmail.com>, <martin.lau@linux.dev>,
 <ast@kernel.org>, <daniel@iogearbox.net>, <andrii@kernel.org>,
 <eddyz87@gmail.com>, <song@kernel.org>, <yonghong.song@linux.dev>,
 <john.fastabend@gmail.com>, <kpsingh@kernel.org>, <sdf@fomichev.me>,
 <haoluo@google.com>, <jolsa@kernel.org>, <shuah@kernel.org>,
 <chengkaitao@kylinos.cn>, <linux-kselftest@vger.kernel.org>
X-Mailer: aerc 0.20.1
References: <20260316112843.78657-1-pilgrimtao@gmail.com>
 <20260316112843.78657-6-pilgrimtao@gmail.com>
In-Reply-To: <20260316112843.78657-6-pilgrimtao@gmail.com>

On Mon Mar 16, 2026 at 7:28 AM EDT, Chengkaitao wrote:
> From: Kaitao Cheng <chengkaitao@kylinos.cn>
>
> Add a new kfunc bpf_list_add_impl(head, new, prev, meta, off) that
> inserts 'new' after 'prev' in the BPF linked list. Both must be in
> the same list; 'prev' must already be in the list. The new node must
> be an owning reference (e.g. from bpf_obj_new); the kfunc consumes
> that reference and the node becomes non-owning once inserted.
>
> We have added an additional parameter bpf_list_head *head to
> bpf_list_add_impl, as the verifier requires the head parameter to
> check whether the lock is being held.
>
> Returns 0 on success, -EINVAL if 'prev' is not in a list or 'new'
> is already in a list (or duplicate insertion). On failure, the
> kernel drops the passed-in node.
>
> Signed-off-by: Kaitao Cheng <chengkaitao@kylinos.cn>
> ---
>  kernel/bpf/helpers.c  | 14 ++++++++++++++
>  kernel/bpf/verifier.c | 13 +++++++++++--
>  2 files changed, 25 insertions(+), 2 deletions(-)
>
> diff --git a/kernel/bpf/helpers.c b/kernel/bpf/helpers.c
> index a9665f97b3bc..dc4f8b4eec01 100644
> --- a/kernel/bpf/helpers.c
> +++ b/kernel/bpf/helpers.c
> @@ -2438,6 +2438,19 @@ __bpf_kfunc int bpf_list_push_back_impl(struct bpf=
_list_head *head,
>  	return __bpf_list_add(new, head, &h->prev, meta ? meta->record : NULL, =
off);
>  }
> =20
> +__bpf_kfunc int bpf_list_add_impl(struct bpf_list_head *head,
> +				  struct bpf_list_node *new,
> +				  struct bpf_list_node *prev,
> +				  void *meta__ign, u64 off)
> +{
> +	struct bpf_list_node_kern *kn =3D (void *)new, *kp =3D (void *)prev;
> +	struct btf_struct_meta *meta =3D meta__ign;
> +	struct list_head *prev_ptr =3D &kp->list_head;
> +

You need to add a version of the check you added on patch 4 here to make
sure the node owners are sane. The check was a WARN_ON because before
the callers to __bpf_list_add didn't take a separate head and node
argument from the program, so any inconsistency was a bug. With this
helper this is no longer the case.

Also check the comment in Sashiko. Can you either add a test that ensures
the use-after-free is described is not the case, or otherwise change
the error handling/verifier behavior to avoid it? I suspect it's an
actual issue.

In general your code is conflating two different issues in its error
handling: 1) A node is being inserted into two different lists at the=20
same time, 2) the user has made a programming error and is supplying=20
an invalid head/prev combination. These are two very different issues,
and 2) is only possible with this new kfunc. Can you add error handling
for it directly in bpf_list_add_impl, and assume the head/prev
combination is alsways valid in __bpf_list_add?

> +	return __bpf_list_add(kn, head, &prev_ptr,
> +			      meta ? meta->record : NULL, off);
> +}
> +
>  static struct bpf_list_node *__bpf_list_del(struct bpf_list_head *head,
>  					    struct list_head *n)
>  {
> @@ -4574,6 +4587,7 @@ BTF_ID_FLAGS(func, bpf_list_pop_back, KF_ACQUIRE | =
KF_RET_NULL)
>  BTF_ID_FLAGS(func, bpf_list_del, KF_ACQUIRE | KF_RET_NULL)
>  BTF_ID_FLAGS(func, bpf_list_front, KF_RET_NULL)
>  BTF_ID_FLAGS(func, bpf_list_back, KF_RET_NULL)
> +BTF_ID_FLAGS(func, bpf_list_add_impl)
>  BTF_ID_FLAGS(func, bpf_task_acquire, KF_ACQUIRE | KF_RCU | KF_RET_NULL)
>  BTF_ID_FLAGS(func, bpf_task_release, KF_RELEASE)
>  BTF_ID_FLAGS(func, bpf_rbtree_remove, KF_ACQUIRE | KF_RET_NULL)
> diff --git a/kernel/bpf/verifier.c b/kernel/bpf/verifier.c
> index e928ad4290c7..98ddb370feb5 100644
> --- a/kernel/bpf/verifier.c
> +++ b/kernel/bpf/verifier.c
> @@ -12506,6 +12506,7 @@ enum special_kfunc_type {
>  	KF_bpf_refcount_acquire_impl,
>  	KF_bpf_list_push_front_impl,
>  	KF_bpf_list_push_back_impl,
> +	KF_bpf_list_add_impl,
>  	KF_bpf_list_pop_front,
>  	KF_bpf_list_pop_back,
>  	KF_bpf_list_del,
> @@ -12567,6 +12568,7 @@ BTF_ID(func, bpf_obj_drop_impl)
>  BTF_ID(func, bpf_refcount_acquire_impl)
>  BTF_ID(func, bpf_list_push_front_impl)
>  BTF_ID(func, bpf_list_push_back_impl)
> +BTF_ID(func, bpf_list_add_impl)
>  BTF_ID(func, bpf_list_pop_front)
>  BTF_ID(func, bpf_list_pop_back)
>  BTF_ID(func, bpf_list_del)
> @@ -12644,6 +12646,7 @@ BTF_ID(func, bpf_stream_print_stack)
>  static const enum special_kfunc_type bpf_list_api_kfuncs[] =3D {
>  	KF_bpf_list_push_front_impl,
>  	KF_bpf_list_push_back_impl,
> +	KF_bpf_list_add_impl,
>  	KF_bpf_list_pop_front,
>  	KF_bpf_list_pop_back,
>  	KF_bpf_list_del,
> @@ -12655,6 +12658,7 @@ static const enum special_kfunc_type bpf_list_api=
_kfuncs[] =3D {
>  static const enum special_kfunc_type bpf_list_node_api_kfuncs[] =3D {
>  	KF_bpf_list_push_front_impl,
>  	KF_bpf_list_push_back_impl,
> +	KF_bpf_list_add_impl,
>  	KF_bpf_list_del,
>  };
> =20
> @@ -14345,6 +14349,7 @@ static int check_kfunc_call(struct bpf_verifier_e=
nv *env, struct bpf_insn *insn,
> =20
>  	if (meta.func_id =3D=3D special_kfunc_list[KF_bpf_list_push_front_impl]=
 ||
>  	    meta.func_id =3D=3D special_kfunc_list[KF_bpf_list_push_back_impl] =
||
> +	    meta.func_id =3D=3D special_kfunc_list[KF_bpf_list_add_impl] ||
>  	    meta.func_id =3D=3D special_kfunc_list[KF_bpf_rbtree_add_impl]) {

Can you use the macros you defined on patch one to replace this list and
the one below?

>  		release_ref_obj_id =3D regs[BPF_REG_2].ref_obj_id;
>  		insn_aux->insert_off =3D regs[BPF_REG_2].var_off.value;
> @@ -23357,13 +23362,17 @@ static int fixup_kfunc_call(struct bpf_verifier=
_env *env, struct bpf_insn *insn,
>  		*cnt =3D 3;
>  	} else if (desc->func_id =3D=3D special_kfunc_list[KF_bpf_list_push_bac=
k_impl] ||
>  		   desc->func_id =3D=3D special_kfunc_list[KF_bpf_list_push_front_impl=
] ||
> +		   desc->func_id =3D=3D special_kfunc_list[KF_bpf_list_add_impl] ||
>  		   desc->func_id =3D=3D special_kfunc_list[KF_bpf_rbtree_add_impl]) {
>  		struct btf_struct_meta *kptr_struct_meta =3D env->insn_aux_data[insn_i=
dx].kptr_struct_meta;
>  		int struct_meta_reg =3D BPF_REG_3;
>  		int node_offset_reg =3D BPF_REG_4;
> =20
> -		/* rbtree_add has extra 'less' arg, so args-to-fixup are in diff regs =
*/
> -		if (desc->func_id =3D=3D special_kfunc_list[KF_bpf_rbtree_add_impl]) {
> +		/* list/rbtree_add_impl have an extra arg (prev/less),
> +		 * so args-to-fixup are in different regs.
> +		 */
> +		if (desc->func_id =3D=3D special_kfunc_list[KF_bpf_list_add_impl] ||
> +		    desc->func_id =3D=3D special_kfunc_list[KF_bpf_rbtree_add_impl]) {
>  			struct_meta_reg =3D BPF_REG_4;
>  			node_offset_reg =3D BPF_REG_5;
>  		}

