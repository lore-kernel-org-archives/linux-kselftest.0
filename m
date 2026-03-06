Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com [209.85.221.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59A612EF660
	for <linux-kselftest@vger.kernel.org>; Fri,  6 Mar 2026 00:53:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.68
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772758405; cv=pass; b=VmNg+85COt8ZYhFrDp1oDY9RxdbvCIzkfqgkAEHA/mtsUEbGtWHaCEo/mcMTVNr4srajE7kCzou7Y6/7hbyD7ce28sEpaDTLjKF+B68NCgkcULofDaTY6TRNiaY+yIfWFqyZ1Suq3mL0U1xF49aM+CgvNuemI1DECSxEi26mrc0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772758405; c=relaxed/simple;
	bh=c8V1J5yjvc0E+ktwKWw3nGtIB24t7mazAmUfzyLEZhk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tPMewvz8iX9zRaPdUPIbxLPPuvTAwMl7x6KPbrPLCOZQYHdmkwSlzhhKfFQT0fLQPXC8fprZR0IzMc7pAI8cgfWyMe4enaRR6ilP8nA8nc0hA+ddrBsn6JeYmqDUQhrenfmSShklMWrHNozQUjnnjKK1UUeJdHv9dhOKyoeQV9g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LhnMLgir; arc=pass smtp.client-ip=209.85.221.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LhnMLgir"
Received: by mail-wr1-f68.google.com with SMTP id ffacd0b85a97d-439ce3605ecso970213f8f.0
        for <linux-kselftest@vger.kernel.org>; Thu, 05 Mar 2026 16:53:23 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772758402; cv=none;
        d=google.com; s=arc-20240605;
        b=ahPPhji1ozcegxg5em36+Y0S4tYKrLTLgqiYCNjUC7GDsuQmyf/x5sFqUxCD6S/zRX
         i4vfT/Adcnah8pPnx89LituMairRrx9wR5eZ2CuUSlzKCryBCKipIx4PBLX+0kfSERI7
         6nZyEmdqYd2cEQK+X7DWt0wRglBTWcKeo/zOQE/pJ9W83K/05z1tdCNJCMM7UGNv7BXo
         Ef+xdRJ8qgQXnQWpw2nOr9ohiA1w0QsEE3EZTfeQwR1cvT/2s3PTfNZwWx0OGocZUVCq
         Uiy4g6OQTSfEX5urRRKz/NNzvPy4t2AhsEUkRVhYl0VUACxLgo3EEgcCBh8xxrIciFx+
         Fp1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=o934O9rol7PMl2M/zW//XmCJcGxtE1M+wZq60dJEZ0c=;
        fh=tQTpgORvS34tZ3IeFtEqR5PSMg0sE8ErmT48YLcO0mY=;
        b=Vq7S+qzD7uNNyOIk+hdOYJwmeJNodom9QXDR90mkzxd9nE0SLND50JX/Rj4nXhoyR0
         RIukUdp9zkLT6Ageop9AA8Bk2v61NzahRmVFLjiWFa69PQjlLTnVfFNDdEtQqvcQgCqD
         7cbbuNxVwi7azO95Sn/crwXZmfRtBJuCU8cTe2sHdB6KyZXnzCaO08FuMI2lENU9lsGg
         ygQmPpo45T7g4trcGieslCqFjuwefYqs3UTvqXPk+BchZSMMu7qoHG/OaK/QmjFmy9FY
         ShIXgNoPbHnx4ibZ3s0VmDKs9YImpM28V+L5BHDdVdhEq0r3t4NHgfLir26mAIW6ZAZc
         1Mrg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772758402; x=1773363202; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=o934O9rol7PMl2M/zW//XmCJcGxtE1M+wZq60dJEZ0c=;
        b=LhnMLgirs2W1Qx8Aw60lRZxSdag9vVITyaKqcVs9CxC8nZW6mwgyhSO5PpI3NbYue6
         CTfp2SZA2i+bzKJSAK5eVnOYAcJNLDNrI4H8wXlM38Vdy0ymoMgiGk3f6A4ea8NLlQOx
         V721KIvaqrhl+49orEsOTw0ktC+UogDvk+e/o+cEFsriVgaITjL+dEFR7nQ4OeO56f6t
         WCU4Oew12Waopwivvdeo7yOvnbl4r9KXWG2KAvaWb0ME0/ZrbKaS0Sxgk8TCByRHxbYT
         C+WLnyfuwkWVs4zZvhonsoOePefe4720V2UqjJscs+YU8UN6r7QObeUHFRBvCwbA7Bjc
         4/CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772758402; x=1773363202;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o934O9rol7PMl2M/zW//XmCJcGxtE1M+wZq60dJEZ0c=;
        b=OyOd+UBvD0gAwMA7UfOQZqXAYzKMy9SiMMmye7ayfPfVgdhTejx773f5iYwXQ/KFCr
         u6qDaZVekPHqomQtoo4D2hy/UfBq+kDLlbEHeBcPfBA6XPpdpBPay1bX1lYFwHRXQgun
         ECeTXDjJ+gDy7NTuCfedYjxYMT/17gq+POfoJv6h6XOKKRu3bEaFzFG8K8xxkK6V+ZAg
         X5Y3ChOpvEmWmLjWXHDme32Iz4wNYz+VS11YlzQx0pnXgBO9hc1C6uA2lt6y0ulnXuHc
         zXDc3ZoOa3JZiFBGx9Mp1VkBT0wWH1ehKotEIat6hLz4EQOApK0fYalozFCVMKetFkyy
         BRFg==
X-Forwarded-Encrypted: i=1; AJvYcCUKIgOaDDSfyuqeEE+jVsSxF5uV5WoOnuIUl3gHW5JIxgrr23gO8QoXusriHJduFeCXNOAPP5BVfti1nfsWICU=@vger.kernel.org
X-Gm-Message-State: AOJu0YzeyWzZlk06HNLzPsG/L8RbP/Nd6TdPrHXt1o4uLuvWT8pYWCr4
	DlSwYa+oEqHKK0QIWDpApXafKyYFoSnyPfLK+33uuVCibkRZl0qN2j9er7y2rcanBMeOtYLeoPU
	cdvLrVsCLHdi5XNWHxnY4EskXC9g1w0M=
X-Gm-Gg: ATEYQzxb+RKRfJGB3rXLLJLZNhbZkeSCLn9/C4OSwR9u/Be/Hb2oTz+YQE0ES3HKXqK
	fekDysGmZuESOa7y36nAr2bPjWQ7+ILQIdABDFuuUymXRnlQ4WaghUu0ohC9vtspUkeX3Z4E8nq
	rRfVZRulOIa9n+2ENC2B3noqFOeTySyOW7EFvPzfVn7n/HgBveOcxK4v3CZrWG23mxlv7AcAUnv
	2c75HsqgwQcwBqTDa1gNBGV2rlNkXUFsKqY337QStxhQ8Ao9B7n+OmVAQxMHrwQPd0/dspcr+VS
	Dxr8nhbOXydBSBpmWYn3peqc9yvkYVdnqne2eRb95mVbluwmp2JdOqQ7v8o=
X-Received: by 2002:a05:6000:40de:b0:439:bcab:4055 with SMTP id
 ffacd0b85a97d-439da8861c8mr411453f8f.34.1772758401671; Thu, 05 Mar 2026
 16:53:21 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260304143459.78059-1-pilgrimtao@gmail.com> <20260304143459.78059-5-pilgrimtao@gmail.com>
In-Reply-To: <20260304143459.78059-5-pilgrimtao@gmail.com>
From: Kumar Kartikeya Dwivedi <memxor@gmail.com>
Date: Fri, 6 Mar 2026 01:52:44 +0100
X-Gm-Features: AaiRm52vZtUosq_3K0fu1C6I0zix5fPyFM2ZByOTfexcRK594utQEYtYZQyFAZk
Message-ID: <CAP01T77tQO8Gwg+XAB5Sq9nHJjorOPQN1ZZUSsof_tMbog5aFg@mail.gmail.com>
Subject: Re: [PATCH v6 4/5] selftests/bpf: Add test cases for bpf_list_del/add/is_edge/empty
To: Chengkaitao <pilgrimtao@gmail.com>
Cc: martin.lau@linux.dev, ast@kernel.org, daniel@iogearbox.net, 
	andrii@kernel.org, eddyz87@gmail.com, song@kernel.org, 
	yonghong.song@linux.dev, john.fastabend@gmail.com, kpsingh@kernel.org, 
	sdf@fomichev.me, haoluo@google.com, jolsa@kernel.org, shuah@kernel.org, 
	chengkaitao@kylinos.cn, linux-kselftest@vger.kernel.org, bpf@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 4 Mar 2026 at 15:51, Chengkaitao <pilgrimtao@gmail.com> wrote:
>
> From: Kaitao Cheng <chengkaitao@kylinos.cn>
>
> Extend the refcounted_kptr test: add a node to both an rbtree and a
> list, retrieve the node from the rbtree to obtain the node pointer,
> then add a new node after the first in the list, and finally use
> bpf_list_del to remove both nodes.
>
> The test asserts that the list is non-empty after insert, asserts the
> first and last nodes after bpf_list_add, and asserts that the list is
> empty after removing both nodes.
>
> To verify the validity of bpf_list_del/add, the test also expects the
> verifier to reject calls to bpf_list_del/add made without holding the
> spin_lock.
>
> Signed-off-by: Kaitao Cheng <chengkaitao@kylinos.cn>
> ---

No reply to or feedback addressed from
https://lore.kernel.org/all/87342fzjq0.fsf@gmail.com.
Please don't respin without acting on it, or explaining why you chose
to skip it.

>  .../testing/selftests/bpf/bpf_experimental.h  |  39 ++++
>  .../selftests/bpf/progs/refcounted_kptr.c     | 182 ++++++++++++++++++
>  2 files changed, 221 insertions(+)
>
> diff --git a/tools/testing/selftests/bpf/bpf_experimental.h b/tools/testing/selftests/bpf/bpf_experimental.h
> index 4b7210c318dd..d5f42ed69166 100644
> --- a/tools/testing/selftests/bpf/bpf_experimental.h
> +++ b/tools/testing/selftests/bpf/bpf_experimental.h
> @@ -99,6 +99,45 @@ extern struct bpf_list_node *bpf_list_pop_front(struct bpf_list_head *head) __ks
>   */
>  extern struct bpf_list_node *bpf_list_pop_back(struct bpf_list_head *head) __ksym;
>
> +/* Description
> + *     Remove 'node' from the BPF linked list with head 'head'.
> + *     The node must be in the list. Caller receives ownership of the
> + *     removed node and must release it with bpf_obj_drop.
> + * Returns
> + *     Pointer to the removed bpf_list_node, or NULL if 'node' is NULL
> + *     or not in the list.
> + */
> +extern struct bpf_list_node *bpf_list_del(struct bpf_list_head *head,
> +                                         struct bpf_list_node *node) __ksym;
> +
> +/* Description
> + *     Insert 'new' after 'prev' in the BPF linked list with head 'head'.
> + *     The bpf_spin_lock protecting the list must be held. 'prev' must already
> + *     be in that list; 'new' must not be in any list. The 'meta' and 'off'
> + *     parameters are rewritten by the verifier, no need for BPF programs to
> + *     set them.
> + * Returns
> + *     0 on success, -EINVAL if head is NULL, prev is not in the list with head,
> + *     or new is already in a list.
> + */
> +extern int bpf_list_add_impl(struct bpf_list_head *head, struct bpf_list_node *new,
> +                            struct bpf_list_node *prev, void *meta, __u64 off) __ksym;
> +
> +/* Convenience macro to wrap over bpf_list_add_impl */
> +#define bpf_list_add(head, new, prev) bpf_list_add_impl(head, new, prev, NULL, 0)
> +
> +/* Description
> + *     Return true if 'node' is the first (when 'is_first' is true) or the last
> + *     (when 'is_first' is false) node in the list with head 'head'.
> + */
> +extern bool bpf_list_node_is_edge(struct bpf_list_head *head,
> +                                 struct bpf_list_node *node, bool is_first) __ksym;
> +
> +/* Description
> + *     Return true if the list with head 'head' has no entries.
> + */
> +extern bool bpf_list_empty(struct bpf_list_head *head) __ksym;
> +

Except the macro, the rest can come from vmlinux.h.

>  /* Description
>   *     Remove 'node' from rbtree with root 'root'
>   * Returns
> diff --git a/tools/testing/selftests/bpf/progs/refcounted_kptr.c b/tools/testing/selftests/bpf/progs/refcounted_kptr.c
> index 1aca85d86aeb..aca201f9fb56 100644
> --- a/tools/testing/selftests/bpf/progs/refcounted_kptr.c
> +++ b/tools/testing/selftests/bpf/progs/refcounted_kptr.c
> @@ -367,6 +367,188 @@ long insert_rbtree_and_stash__del_tree_##rem_tree(void *ctx)              \
>  INSERT_STASH_READ(true, "insert_stash_read: remove from tree");
>  INSERT_STASH_READ(false, "insert_stash_read: don't remove from tree");
>
> +/* Insert one node in tree and list, remove it from tree, add a second node
> + * after it with bpf_list_add, check bpf_list_node_is_edge/empty, then
> + * remove both nodes from list via bpf_list_del.
> + */

Incorrect comment style.

> +[...]
>
