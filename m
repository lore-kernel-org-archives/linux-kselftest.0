Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com [209.85.221.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F89E3E8C44
	for <linux-kselftest@vger.kernel.org>; Tue, 10 Mar 2026 20:11:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.67
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773173486; cv=pass; b=GRuOpQairoBAh7aoQFD2hWruIw3fxXG/ceYEBDtFIomPW6oqQrzoO614pBvsh/WzJFTlxbs0OhNaFq7WdDbJslpBRnsWSaJHzcayb64vk/TyIlS3QElYoaHesbuwVAo2pFWa2Yu37bdUvruqLXSVdxdu5gnXPNYYHTTa9JpIp+0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773173486; c=relaxed/simple;
	bh=KH6TI1CJgLScIdJ3pfgq0b/VwY7EIONyx/Ttf0s1ZXI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JzaHiqddHby932ugBH5roWLsmmg3yyS5ZBKRvxmYy5E8J4SJVeOBcCLtSiYImUOPGxUHMlb0/sFY1bIFA3pRvSFBa3RoAJtC1HtpsBDsQc7ljaTMUfx1Ik2ZzXq1TqJX8WeFT1qArwSOc4kfgg/a5WXEXvcalanDbR04tLbfcHk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Kljo3f1v; arc=pass smtp.client-ip=209.85.221.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Kljo3f1v"
Received: by mail-wr1-f67.google.com with SMTP id ffacd0b85a97d-439c5b40f60so6052606f8f.0
        for <linux-kselftest@vger.kernel.org>; Tue, 10 Mar 2026 13:11:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773173483; cv=none;
        d=google.com; s=arc-20240605;
        b=VuNgmU3nxpZI0TgnnIKg6pndPk04//5Dkaa4MZAnE3uV7hpBgeYNs+owRRJ5c6GKhj
         RP+JZZ/R8/jjYB5+PRNcjyEw1I53rnUkIVTXkLlHsjssVTt3Wq2cgwvWrIcufHnZLwt3
         nTrwiZs8bn4IerCr/bt1QSYXUebgIPqvKbUh8DsfjKRqpp9PbJ0aNVtPgSC2eXeRyY6a
         ryB4tA6q2C5uYQAidbiYpZSlSMJv7HelDPRf8HySUIXXvbVqr4EfN1QIduKkN6TJYmXc
         EBI9+3UxLx7FNXy04G829wlhiPQ0KLNe1t7OqmTSUfDCUryFH5O32V06fH8jEyxUIyRI
         cNUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=l4y9JKyQTQhhwD8npDhTNgMVn2loVCUsWZp9a/UY0vI=;
        fh=HUjX25Npkio7/u1Ze3cp4z649Q7dVf3PlivIIbbg/Ok=;
        b=GaB9RSt/az7TivQpDVvIFKMXBRC0X9M/0zek0YMin8z/dBc9Yh484w17z7YtYaZEds
         /Z3pVz+5wLAFwcRB84+2aXBqaxEVZ9sn6W6GqzUoHtZafSgd1I4rCAKpwQ5vlTF7So4q
         56xplHwnuwHtourrQIbqPxxvig1LfbBE3zQ64lcsdFAF4EPwa6i54zPqhZZC8GxXewau
         Isl8GNEeGQpSY6hpW3lXDcjL56IPp0w1X2FqKfbSCj6lu0Fj4FjPHS/nBfODSjPYML49
         XNGJvAqx0AP+uLKnYuS9i1YI/nltlfOK0wqiW8Is2LONG0ZkgX9TbmQzarsCFnKnuAoe
         1sbA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773173483; x=1773778283; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=l4y9JKyQTQhhwD8npDhTNgMVn2loVCUsWZp9a/UY0vI=;
        b=Kljo3f1vrowQsU4IhAUbkgE8lcqeY6/q00yAWBYVRxMzurYZtKSeCtXzB0xUniT/u0
         E5eUmZ1iebfx5QWGsKHab3xt0O5Ee4xihmgR8IXxuBEnqVsXbbfHZVmK+YBegbSjJaCO
         yfhAf0/bilK6D1cPRxbDpBLXDhRwIcgEHpal92QzHeZ1EpSSfwl4jET36j1Ntbl44AcY
         gPDC+NASka4kzkG8gpYwRl7Onkx7yEqEehqcQDwI2O2ZNVdTo2Al/a/MT9mSOjp6ycdy
         X+FPQtxxFrquX2XOci24WoGA9FrEKmdm+MRDQcKFkzgQyBfYP0u8ZqRxVmrR9vgjWAMr
         RYnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773173483; x=1773778283;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l4y9JKyQTQhhwD8npDhTNgMVn2loVCUsWZp9a/UY0vI=;
        b=AXPB5j7MFT48pcrA0obQjbvpFm/K60RcgnRqUe20PGcxJirPkaHlV9EzpHo93LY6AQ
         2BYX0dfrSSG0wb9JuFFHI6U4R2qIqwLGixTGBoTlVwRTyG8p8Q7qQQ48Ne820uW31CR6
         J2yRMCAhhnINnoe1S4AjKw5GyROVJxXC5uO+o9fpq92/nEmA2pN0dItq+CHJwUoptcta
         gnok/9rwsoXGGFu2607tplttYLIFVwhJaitgQDuAhRzWnbiJmc3OoloqXbv968gtrGwu
         0M2+u2F9txnV8ewicg4ip2QetIj0ZJUXHyjQzF88wvviDK2GRN40aMG0+E9Zg/crimGV
         8+LA==
X-Forwarded-Encrypted: i=1; AJvYcCW5T8zAcg8yHWr+TJdUIlZFkM3Js9ksc/oX4BkYmZNa7iJgxAgwXcOmG4HPGQUVngODGS6sH/lusNo7jzB9TuA=@vger.kernel.org
X-Gm-Message-State: AOJu0YzcJYK+NWA6LkLUDVfu3FmhMLsswwG8BrI8llMe8puCNgsklXpp
	uhJy/J5f+CDVM0kt3dcPRg5L1x+fL+/22kSxXfyohOT+KEiclRinPqlOFOw9b7ddOMw+sF+ECW5
	ZDB/EQRsegDYVOTwAIGxqTuIPaggKrCo=
X-Gm-Gg: ATEYQzyXArnvcSnMI+UDnttdXL+pazT2ZcXm2Xe2raPKmbbWuoSMuUGySE1S99OKGgg
	O6dVSh7yPzs6bQZHV7oVYT8lqYjmK/VkQZ/1GseckBiYC4cbeIBjd6rnJmKSDYp9qEHbl4J68ZA
	7HhzzxvBkJrgeH9qUcBC1KBL/n3Yl4QI+a6G0LfKrVs82RRT4hZZE9jIaHWsqiIF+zyyz14ShRl
	OH4DZ9K0Js8GGrtCQ6iFgnKnb+N7eS2UHyJJHLmm26BgtbpXXvRf+QAu0FHOptCr//Wq/S3hL29
	tELazu1MbiJFOHC5fCN5c+VgBxRaq8fNvhETGovnG5FGgPXYud1Fz9eMXTv7
X-Received: by 2002:a5d:64e7:0:b0:439:d242:e8fe with SMTP id
 ffacd0b85a97d-439f81bd8c7mr386571f8f.11.1773173482816; Tue, 10 Mar 2026
 13:11:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260308134614.29711-1-pilgrimtao@gmail.com> <20260308134614.29711-3-pilgrimtao@gmail.com>
In-Reply-To: <20260308134614.29711-3-pilgrimtao@gmail.com>
From: Kumar Kartikeya Dwivedi <memxor@gmail.com>
Date: Tue, 10 Mar 2026 21:10:46 +0100
X-Gm-Features: AaiRm51q-Rv9lnXkTdWbr8TTFNHxvQEDWNGHts5HUznKWcWP9W8F1uyPDlWx_n8
Message-ID: <CAP01T77RJBv_Bv5zRYPggDVD_3VASuGi3zvd8QJmthbHmz45fA@mail.gmail.com>
Subject: Re: [PATCH bpf-next v7 2/5] bpf: Add bpf_list_add_impl to insert node
 after a given list node
To: Chengkaitao <pilgrimtao@gmail.com>
Cc: martin.lau@linux.dev, ast@kernel.org, daniel@iogearbox.net, 
	andrii@kernel.org, eddyz87@gmail.com, song@kernel.org, 
	yonghong.song@linux.dev, john.fastabend@gmail.com, kpsingh@kernel.org, 
	sdf@fomichev.me, haoluo@google.com, jolsa@kernel.org, shuah@kernel.org, 
	chengkaitao@kylinos.cn, linux-kselftest@vger.kernel.org, bpf@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Sun, 8 Mar 2026 at 14:47, Chengkaitao <pilgrimtao@gmail.com> wrote:
>
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
>  kernel/bpf/helpers.c  | 56 ++++++++++++++++++++++++++++++-------------
>  kernel/bpf/verifier.c | 13 ++++++++--
>  2 files changed, 50 insertions(+), 19 deletions(-)
>
> diff --git a/kernel/bpf/helpers.c b/kernel/bpf/helpers.c
> index 01b74c4ac00d..407520fde668 100644
> --- a/kernel/bpf/helpers.c
> +++ b/kernel/bpf/helpers.c
> @@ -2379,11 +2379,12 @@ __bpf_kfunc void *bpf_refcount_acquire_impl(void *p__refcounted_kptr, void *meta
>         return (void *)p__refcounted_kptr;
>  }
>
> -static int __bpf_list_add(struct bpf_list_node_kern *node,
> -                         struct bpf_list_head *head,
> -                         bool tail, struct btf_record *rec, u64 off)
> +static int __bpf_list_add(struct bpf_list_head *head,
> +                         struct bpf_list_node_kern *new,
> +                         struct list_head *prev,
> +                         struct btf_record *rec, u64 off)
>  {
> -       struct list_head *n = &node->list_head, *h = (void *)head;
> +       struct list_head *n = &new->list_head, *h = (void *)head;
>
>         /* If list_head was 0-initialized by map, bpf_obj_init_field wasn't
>          * called on its fields, so init here
> @@ -2391,39 +2392,59 @@ static int __bpf_list_add(struct bpf_list_node_kern *node,
>         if (unlikely(!h->next))
>                 INIT_LIST_HEAD(h);
>
> -       /* node->owner != NULL implies !list_empty(n), no need to separately
> +       /* When prev is not the list head, it must be a node in this list. */
> +       if (prev != h && WARN_ON_ONCE(READ_ONCE(container_of(
> +           prev, struct bpf_list_node_kern, list_head)->owner) != head))
> +               goto fail;

There is a slight issue here, if head is not initialized, prev will be
NULL here, since it passes h->prev.
So we'll do a bad deref. I think we should probably pass a pointer to
prev (list_head **) and then load it after INIT_LIST_HEAD(h) is done.
prev != h check looks ok (since we want to establish that prev is not
a node) otherwise.

Probably also add a test for such a case to catch this sort of bug.
You can see whether it crashes without changing your patch, and
doesn't with the fix.

> +
> +       /* new->owner != NULL implies !list_empty(n), no need to separately
>          * check the latter
>          */
> -       if (cmpxchg(&node->owner, NULL, BPF_PTR_POISON)) {
> -               /* Only called from BPF prog, no need to migrate_disable */
> -               __bpf_obj_drop_impl((void *)n - off, rec, false);
> -               return -EINVAL;
> -       }
> -
> -       tail ? list_add_tail(n, h) : list_add(n, h);
> -       WRITE_ONCE(node->owner, head);
> +       if (cmpxchg(&new->owner, NULL, BPF_PTR_POISON))
> +               goto fail;
>
> +       list_add(n, prev);
> +       WRITE_ONCE(new->owner, head);
>         return 0;
> +
> +fail:
> +       /* Only called from BPF prog, no need to migrate_disable */
> +       __bpf_obj_drop_impl((void *)n - off, rec, false);
> +       return -EINVAL;
>  }
>
> [...]
> @@ -12996,6 +12998,7 @@ static bool is_bpf_list_api_kfunc(u32 btf_id)
>  {
>         return btf_id == special_kfunc_list[KF_bpf_list_push_front_impl] ||
>                btf_id == special_kfunc_list[KF_bpf_list_push_back_impl] ||
> +              btf_id == special_kfunc_list[KF_bpf_list_add_impl] ||
>                btf_id == special_kfunc_list[KF_bpf_list_pop_front] ||
>                btf_id == special_kfunc_list[KF_bpf_list_pop_back] ||
>                btf_id == special_kfunc_list[KF_bpf_list_del] ||
> @@ -13122,6 +13125,7 @@ static bool check_kfunc_is_graph_node_api(struct bpf_verifier_env *env,
>         case BPF_LIST_NODE:
>                 ret = (kfunc_btf_id == special_kfunc_list[KF_bpf_list_push_front_impl] ||
>                        kfunc_btf_id == special_kfunc_list[KF_bpf_list_push_back_impl] ||
> +                      kfunc_btf_id == special_kfunc_list[KF_bpf_list_add_impl] ||
>                        kfunc_btf_id == special_kfunc_list[KF_bpf_list_del]);
>                 break;
>         case BPF_RB_NODE:
> @@ -14264,6 +14268,7 @@ static int check_kfunc_call(struct bpf_verifier_env *env, struct bpf_insn *insn,
>
>         if (meta.func_id == special_kfunc_list[KF_bpf_list_push_front_impl] ||
>             meta.func_id == special_kfunc_list[KF_bpf_list_push_back_impl] ||
> +           meta.func_id == special_kfunc_list[KF_bpf_list_add_impl] ||
>             meta.func_id == special_kfunc_list[KF_bpf_rbtree_add_impl]) {
>                 release_ref_obj_id = regs[BPF_REG_2].ref_obj_id;
>                 insn_aux->insert_off = regs[BPF_REG_2].off;

Please rebase patches on bpf-next/master always before sending, this
one didn't apply cleanly.


> @@ -23230,13 +23235,17 @@ static int fixup_kfunc_call(struct bpf_verifier_env *env, struct bpf_insn *insn,
>                 *cnt = 3;
>         } else if (desc->func_id == special_kfunc_list[KF_bpf_list_push_back_impl] ||
>                    desc->func_id == special_kfunc_list[KF_bpf_list_push_front_impl] ||
> +                  desc->func_id == special_kfunc_list[KF_bpf_list_add_impl] ||
>                    desc->func_id == special_kfunc_list[KF_bpf_rbtree_add_impl]) {
>                 struct btf_struct_meta *kptr_struct_meta = env->insn_aux_data[insn_idx].kptr_struct_meta;
>                 int struct_meta_reg = BPF_REG_3;
>                 int node_offset_reg = BPF_REG_4;
>
> -               /* rbtree_add has extra 'less' arg, so args-to-fixup are in diff regs */
> -               if (desc->func_id == special_kfunc_list[KF_bpf_rbtree_add_impl]) {
> +               /* list/rbtree_add_impl have an extra arg (prev/less),
> +                * so args-to-fixup are in different regs.
> +                */
> +               if (desc->func_id == special_kfunc_list[KF_bpf_list_add_impl] ||
> +                   desc->func_id == special_kfunc_list[KF_bpf_rbtree_add_impl]) {
>                         struct_meta_reg = BPF_REG_4;
>                         node_offset_reg = BPF_REG_5;
>                 }
> --
> 2.50.1 (Apple Git-155)
>
>
