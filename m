Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793989816;
	b=kjeh3aQ5cs2IxWM2xQo9bhcdY+bVkyvZYpxlzHqT76onABBymBp8+uDJ455OsNDVoJdf
	 1sUvzt7yvwhJO86pgT0C0oykYssSx0coemVU/pl2ac0JdzshbkloLJ0WyYH/Sj99IUXx1
	 QIFLzf64OOd1TJYYcNIiYXAL/rlc4ULayZPBTd5ZdG4/kvN89GxVRQ2o5aJg2Gevt0hiQ
	 1nO8z6ioGupay/87WLE/i9DXq+pzjV0Df9dXwJBBbKe77UNW6NQe0Az5lStwSbPy7QCsY
	 YYWLdGnHy3Q6HyTXjWp0e9vu8en157c/bls7z0evxJy223Ri6HbXggo5j26qaXoKDtQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793989816;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=UliTkuKSwijkprFnPvplR6mcOQUjgocutB6yCvWNZyo=;
	b=xPjcsIareB8XsJ9UnFj2iLuwoTlKW/L8NEaSAIxrpU5LIVX7XaI0HRYh0xeodh8/020P
	 xwXRjgwAJNECZ8qCAeAeMnbE9zUXAX7iiDBOiLgLh9ASlLSQtThulA2mb4fOKHdphLhUp
	 W89oLwZ1ynw21WUMKx5UeWnouQ00L1k6NkuKiGgkqM1G5HN6n0GfgF5Xn5NhIF5ZEsmmV
	 +bxpAu6i4jFRHkT1ax1j6aVOPDc8iwg4wQYEdfniz2l95ISwdWF5F19ybnfKw53EGv9rp
	 xH6zh0bDQDUyqZObvdbybe2iODRiYFYvkyjJeduxarwilxbAg4JVu+3YdeNGUNNhlqQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux.win;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.218.46
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BDC9606A32F
	for <linux-kselftest@vger.kernel.org>; Fri,  6 Nov 2026 18:30:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3BDC9606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.win
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-c4c9abc1824so139706366b.1
        for <linux-kselftest@vger.kernel.org>; Fri, 06 Nov 2026 10:30:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793989815; x=1794594615;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UliTkuKSwijkprFnPvplR6mcOQUjgocutB6yCvWNZyo=;
        b=LFkwY73cPWlF4EBlX1LEzX/C+hMSL6CVVbC0tXg6tVy2aXXcgz6vAyCL6a1Kuz6j5A
         U2+0s8SXqlSAezIDNk6slcARj1HLICWvFMNcyNA27wb39SlMxtcH1X9AO0+QQhrHStyi
         3CWRA00iyqIwbuurpkYqn8pFBoL9YY3+3iE0zG4wprekt22WhNPySB1XvwgJvKl6yikF
         l3N9HXmVoi0wtFd1FnlijYroCcI+dk1iGO2ajTHSvXBE2MV6Fp2j17nUaugMLnf3PHVM
         aLmxMTf20/88eMkYzkF60Hpy7uQTNh9RDZJ0Gt/itvW3jnviS87z/c+8XY4vX7wUanWq
         ZNMQ==
X-Forwarded-Encrypted: i=1; AKwUvBxDm6DterPRUpLVmrBfufP03rCjS3JfmEc/4j8IW/eAqUzfvhCVVVdcfndYFsdeS+oiAhtUjtXCKMvc/Yb0Q+4=@vger.kernel.org
X-Gm-Message-State: APuU4Z9PdCQQShtvwqePABwkGDTlA39MysDkRV5Y3kyCvLYBe/1SRAng
	tbVXUlbd/+JpVDWnuHr88LDRrqpAirj3izrGyE4x3TBnKxuKToH7ldv9IX2Nr2lTipc=
X-Gm-Gg: AYBFou2/d9kMz2T/l0dfkVm2XQEc5d0dhVrYMKskPmahOwobufipQGleMRwNo2D3As9
	sUUuhJzNjElaJfUeBEFaKrsBHuG8sEqzOD+xhUsOaME76KGAI7SU7+DgSC4xDJaDSdEwqjvtTZb
	dO6Rm2c6ici+QvswYFsJAivueufMMhjRt5NR4NAqH1mid7YMAzFuFDq5uQxsL8f6g2wzHkXdkR1
	YvqCu2qRZx6gBQheomzM9tBQghP0MRl5NbgR+XKpTSK7kFr/PKKkJAq7JNumj2vTa+bYFh0c00A
	dR7OT/mqgwJtKgGardN6A6ZlnaJZ/b+aLwQAi0NmbXNOxX0zqrEZpZZzr3crmTgCEBYbraDMfLR
	Qq7McnyYdnELxtHJdLbObPrEFHWhgxyGg+cqe9X8lx+1t0whKlRlOU2QcNXjsFFLXWCpqoB1OJ3
	3xf/rgkmP3wRDrXUgL1pOid/+1Bgokx2ZLDT7Kdyj85r4KT0RaFe92C8r9y5sw8LTDicwYMdnYw
	S8QJQCDvMYxIkyL/idVvM9gql9hB/QsZh0wb+8x2OnaojkbCwtlQlJNb4t9wswtLjyBxKroTp6n
	XkHeRHvQxAGIzZye8p5V1vwVN4tt1+WhZyu06n3m2cKN9P7fs3qDswpr9uQ=
X-Received: by 2002:a17:907:930e:b0:c41:960c:8c62 with SMTP id a640c23a62f3a-c4d3531642amr262748666b.30.1793989814245;
        Fri, 06 Nov 2026 10:30:14 -0800 (PST)
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com. [209.85.218.43])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4d35670910sm97225166b.40.2026.11.06.10.30.08
        for <linux-kselftest@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Nov 2026 10:30:09 -0800 (PST)
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-c450ab1483cso148254866b.3
        for <linux-kselftest@vger.kernel.org>; Fri, 06 Nov 2026 10:30:08 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErFdoVjJC1YsiJACWc1X/lKC9vYCKSJZDwUXHz1+F/wiyJIY/q9n5A7mcFCRIICp5t/SZMu9+qgmSbrHmUt0eUE=@vger.kernel.org
X-Received: by 2002:a17:907:ea89:b0:c4c:bff4:200c with SMTP id
 a640c23a62f3a-c4d3531f031mr283547466b.32.1793989808075; Fri, 06 Nov 2026
 10:30:08 -0800 (PST)
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261029232437.2581640-1-jarkko@kernel.org> <20261029232437.2581640-2-jarkko@kernel.org>
In-Reply-To: <20261029232437.2581640-2-jarkko@kernel.org>
From: Ignat Korchagin <ignat@linux.win>
Date: Fri, 6 Nov 2026 18:29:56 +0000
X-Gmail-Original-Message-ID: <CAOs+rJVNyJwqp4CR-d_T4GVjNMjgbaDL78_mZCVGGvN1xpd33w@mail.gmail.com>
X-Gm-Features: AclHuK8TGNjpH-aL7rdb3WJ8RwrdjoKcrJ52VddwbSIE-hld3YHoMNkMBO-NFbA
Message-ID: <CAOs+rJVNyJwqp4CR-d_T4GVjNMjgbaDL78_mZCVGGvN1xpd33w@mail.gmail.com>
Subject: Re: [PATCH v4 1/3] KEYS: Introduce keyring_is_empty()
To: Jarkko Sakkinen <jarkko@kernel.org>
Cc: David Howells <dhowells@redhat.com>, keyrings@vger.kernel.org, 
	Eric Biggers <ebiggers@kernel.org>, Lukas Wunner <lukas@wunner.de>, 
	Herbert Xu <herbert@gondor.apana.org.au>, "David S. Miller" <davem@davemloft.net>, 
	Alasdair Kergon <agk@redhat.com>, Mike Snitzer <snitzer@kernel.org>, 
	Mikulas Patocka <mpatocka@redhat.com>, Benjamin Marzinski <bmarzins@redhat.com>, 
	"Theodore Y. Ts'o" <tytso@mit.edu>, Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Andrii Nakryiko <andrii@kernel.org>, Eduard Zingerman <eddyz87@gmail.com>, 
	Kumar Kartikeya Dwivedi <memxor@gmail.com>, Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, 
	Emil Tsalapatis <emil@etsalapatis.com>, Ihor Solodrai <ihor.solodrai@linux.dev>, 
	Paul Moore <paul@paul-moore.com>, James Morris <jmorris@namei.org>, 
	"Serge E. Hallyn" <serge@hallyn.com>, Shuah Khan <shuah@kernel.org>, 
	Christian Brauner <brauner@kernel.org>, 
	"open list:ASYMMETRIC KEYS" <linux-crypto@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>, 
	"open list:DEVICE-MAPPER (LVM)" <dm-devel@lists.linux.dev>, 
	"open list:FSVERITY: READ-ONLY FILE-BASED AUTHENTICITY PRO..." <fsverity@lists.linux.dev>, 
	"open list:BPF [GENERAL] (Safe Dynamic Programs and Tools)" <bpf@vger.kernel.org>, 
	"open list:SECURITY SUBSYSTEM" <linux-security-module@vger.kernel.org>, 
	"open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 29, 2026 at 11:25=E2=80=AFPM Jarkko Sakkinen <jarkko@kernel.org=
> wrote:
>
> Introduce keyring_is_empty() in order to decouple for BPF, dm-verity and
> fs-verity how keyring internally manages the keys.
>
> Signed-off-by: Jarkko Sakkinen <jarkko@kernel.org>

Reviewed-by: Ignat Korchagin <ignat@linux.win>

> ---
>  drivers/md/dm-verity-verify-sig.c                      |  2 +-
>  fs/verity/signature.c                                  |  2 +-
>  include/linux/key.h                                    |  1 +
>  kernel/bpf/keys.c                                      |  2 +-
>  security/keys/keyring.c                                | 10 ++++++++++
>  .../selftests/dm-verity/test-dm-verity-keyring.sh      |  2 +-
>  6 files changed, 15 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/md/dm-verity-verify-sig.c b/drivers/md/dm-verity-ver=
ify-sig.c
> index aadcf5e4a47c..cad21e9144ed 100644
> --- a/drivers/md/dm-verity-verify-sig.c
> +++ b/drivers/md/dm-verity-verify-sig.c
> @@ -153,7 +153,7 @@ int verity_verify_root_hash(const void *root_hash, si=
ze_t root_hash_len,
>         if (ret !=3D -ENOKEY && ret !=3D -EKEYREJECTED)
>                 return ret;
>
> -       if (dm_verity_keyring->keys.nr_leaves_on_tree &&
> +       if (!keyring_is_empty(dm_verity_keyring) &&
>             dm_verity_keyring->restrict_link)
>                 ret =3D verify_pkcs7_signature(root_hash, root_hash_len,
>                                              sig_data, sig_len,
> diff --git a/fs/verity/signature.c b/fs/verity/signature.c
> index 0302a4e506ec..890d33b9d812 100644
> --- a/fs/verity/signature.c
> +++ b/fs/verity/signature.c
> @@ -67,7 +67,7 @@ int fsverity_verify_signature(const struct fsverity_inf=
o *vi,
>                 return 0;
>         }
>
> -       if (fsverity_keyring->keys.nr_leaves_on_tree =3D=3D 0) {
> +       if (keyring_is_empty(fsverity_keyring)) {
>                 /*
>                  * The ".fs-verity" keyring is empty, due to builtin sign=
atures
>                  * being supported by the kernel but not actually being u=
sed.
> diff --git a/include/linux/key.h b/include/linux/key.h
> index c4486e938a06..20ca43f5eab1 100644
> --- a/include/linux/key.h
> +++ b/include/linux/key.h
> @@ -439,6 +439,7 @@ extern int restrict_link_reject(struct key *keyring,
>                                 struct key *restriction_key);
>
>  extern int keyring_clear(struct key *keyring);
> +bool keyring_is_empty(const struct key *keyring);
>
>  extern key_ref_t keyring_search(key_ref_t keyring,
>                                 struct key_type *type,
> diff --git a/kernel/bpf/keys.c b/kernel/bpf/keys.c
> index bffc356839ac..24e0416abc99 100644
> --- a/kernel/bpf/keys.c
> +++ b/kernel/bpf/keys.c
> @@ -29,7 +29,7 @@ struct bpf_key *bpf_lookup_keyring(void)
>
>         if (!bpf_keyring)
>                 return NULL;
> -       if (!READ_ONCE(bpf_keyring->keys.nr_leaves_on_tree) ||
> +       if (keyring_is_empty(bpf_keyring) ||
>             !READ_ONCE(bpf_keyring->restrict_link))
>                 return NULL;
>
> diff --git a/security/keys/keyring.c b/security/keys/keyring.c
> index 5281da9d5bf7..ac48d6204915 100644
> --- a/security/keys/keyring.c
> +++ b/security/keys/keyring.c
> @@ -443,6 +443,16 @@ static void keyring_destroy(struct key *keyring)
>         assoc_array_destroy(&keyring->keys, &keyring_assoc_array_ops);
>  }
>
> +/**
> + * keyring_is_empty - Check whether a keyring is empty
> + * @keyring: The keyring to check.
> + */
> +bool keyring_is_empty(const struct key *keyring)
> +{
> +       return READ_ONCE(keyring->keys.nr_leaves_on_tree) =3D=3D 0;
> +}
> +EXPORT_SYMBOL(keyring_is_empty);
> +
>  /*
>   * Describe a keyring for /proc.
>   */
> diff --git a/tools/testing/selftests/dm-verity/test-dm-verity-keyring.sh =
b/tools/testing/selftests/dm-verity/test-dm-verity-keyring.sh
> index 1f9601ef22f8..792449d356cf 100755
> --- a/tools/testing/selftests/dm-verity/test-dm-verity-keyring.sh
> +++ b/tools/testing/selftests/dm-verity/test-dm-verity-keyring.sh
> @@ -746,7 +746,7 @@ test_keyring_inactive_when_empty() {
>      log_info "TEST: Verify dm-verity keyring is inactive when sealed emp=
ty"
>
>      # When keyring_unsealed=3D0, the keyring is sealed immediately while=
 empty
> -    # This means it should NOT be used for verification (nr_leaves_on_tr=
ee=3D0)
> +    # An empty keyring should NOT be used for verification.
>
>      log_info "Keyring state (should be empty and sealed):"
>      list_keyring_keys
> --
> 2.47.3
>
>
