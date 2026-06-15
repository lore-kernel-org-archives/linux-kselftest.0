Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9762B3F58F1
	for <linux-kselftest@vger.kernel.org>; Mon, 15 Jun 2026 14:13:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781532794; cv=none; b=DgwZYJps1kPQTPLUBI6S1xXz2DJnDZSPcwvcPqqM4oQXzgQpkHjSVM3+y1nwRAwiC/gShJHv9hlUNSfbtKHjDchE2YKH2Hm0szecnfBPQsUpWoYeHlKuIImBVbMW8oNTrUvoQcOSOztOtIIamWfezvT973C1ZGUHMRB6GtbAftg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781532794; c=relaxed/simple;
	bh=z1Pf0308GIXx35y7zNiQ26Q7XW1IEbgheztWcG9jfRM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rW6/MVQa6QE4ZjbmPO8DPfkjx/xxwnvXD/lCAhOQFkFNbxCseoYqz1EVCzeYsJ6GKlzsQnLg7wbnAdoLfuh4AElPbjdopvXxHpzKYlvXYpxg1ohyj3pqfxBvmDlZiBIXTVujZN6uxBb4X4nU1UOTbix5Jb3atHauvkxKqyraD08=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=or1c+1i6; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="or1c+1i6"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-45ee5cdbd28so2693394f8f.1
        for <linux-kselftest@vger.kernel.org>; Mon, 15 Jun 2026 07:13:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781532791; x=1782137591; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=TE4i6DUnxedcuW81EIQxjbJU+HuCPuqKLHr71bT1zRk=;
        b=or1c+1i66zFnNks4yOGzwjjIlIA/Nc33hvxyznbmaE6X/+v5vzOJ7jVHPUtilgbgyr
         4xgKXGTlvq9+fhvD4TkKRISuFSdjOvzObnsFn7EImpw+Wn9/g1s7vEsItxaT/26u3Oze
         4tPiZiY8i3EQYeGRu+2K9oEzaWCFs8XKv1dA9O141SgqD+fL3ygJ2DB8shDuF8CdjAkb
         dZ233RjnnMwQ+TpmnceCn4oOzfHB35M2T3/vW+UID9NCMFdK2sFqGS+g45Ejes72lUXT
         e03GuYVY21FxAeCZfUPSkcrr12FCw+1n19gf+DhBa1JAU4ekVpLK2QBQ2ko0SW8A9Ap3
         6O7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781532791; x=1782137591;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TE4i6DUnxedcuW81EIQxjbJU+HuCPuqKLHr71bT1zRk=;
        b=NM5kV1fW/AV08LOjsS1J5wsSj8I6vEw4h7sMjfvZ2Ru6WdRMqkdR9FIn3RKIMwrpbD
         +3FXz7faK7/GFvcBwdOhV6dzfFyBe2R+VFYcY/7rl0hy/2/hG9y8+2Em9Pp/m5k5HxSu
         c3XctTBjFZOxZW7/6S+uVtQX1S5/n67m1EL16TddD2swut6dGJ3IIZnWx6zVZG7lsy6i
         jHcBAUztazVhwDPDN7hXim3JpAxwP7QUiqk29QVSUPwkwg1F0i6PtbM+X7bpbAoM79XJ
         WBv+cn0TXl5fax1cUirEgqzWVL+RD8lUv3/hRPXATRJScsoLYwA4FgSuhwlGCSzMI62Q
         K3YQ==
X-Forwarded-Encrypted: i=1; AFNElJ+TMree0po0nROOjuqaOXGMj1s7wEa9BrP3bXOnDHd34JFymbs+eTec/Fv0qvhCbZ04R8zFhEjAiYUY7oQ6SXk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx3g85aV4s5HC9sC6K+YTdPemN9BK6WdFt3i3ouOiTGLJUkIPov
	wocY7cFSRFe/qYc73bqxVTH7Xgq9dxhQ34TLcFAqZ+eGeLmIVhoyByxu
X-Gm-Gg: Acq92OHKlzQa51XZhpu5/34cYVTxFnFFStQBqfo7kOGEFk9vhEOMRjYxL4s3wbSe2Qa
	VAGDprB/tNInHi933BoZELf6u1NxDTUfF+UoxThnqFvMqJyyGAOsjTf5jFedXceWltxfEw2VDeg
	6sMQpd47nN6WYTMFDySPzyzq6BcuSAkgk0hjRO2ccn3iU2kT9plIBcCPNzZnUyEA7JRo3NAPGGE
	LF/iop6emb5aF21NTNpuSuAwdYeY0j1RvnVZAWY/jy7RZ9gIN7/eJsX2tg8lrzSWkk8vfTjb4kX
	ffyesnrTyTNiwchy2au9e2r/OSfJsc0Zb7KWF7A85OfgHBf8x1tR601IaghaIozudeF58I5jxom
	GF8h2YUODRmbeGXLsJfYOecEJQ1EGO6rb3zzXWlhDFdxZ4Dgq3TN1R9kfIGToGAIMcalV5dUVFH
	2PRAtFcDciewFXfjdvVZJSb6aUWvYFNIYZ8VvIbiypNpQpyVb3AhYYMcOc/McvMz5b3kxm0oTxd
	PpvX6Ay9mkJDCRGo5CgIjVCwMiCpqC5druQLSCQw9H4FbwjCwRAGcCpiUv0nb2xs0oJAaPLm+Lh
	6dD3Z1uYdR9H79/wNTk5BHRJrkqHGzGF7mU0kT7KhYU=
X-Received: by 2002:a05:6000:41e5:b0:45e:8edc:dacc with SMTP id ffacd0b85a97d-4606d03bf34mr18432871f8f.27.1781532790867;
        Mon, 15 Jun 2026 07:13:10 -0700 (PDT)
Received: from mail.gmail.com (2a01cb0889497e009a0d3db09e2f2ffb.ipv6.abo.wanadoo.fr. [2a01:cb08:8949:7e00:9a0d:3db0:9e2f:2ffb])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4606f20e77asm36900828f8f.0.2026.06.15.07.13.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 07:13:10 -0700 (PDT)
Date: Mon, 15 Jun 2026 16:13:08 +0200
From: Paul Chaignon <paul.chaignon@gmail.com>
To: Sun Jian <sun.jian.kdev@gmail.com>
Cc: bpf@vger.kernel.org, netdev@vger.kernel.org,
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
	ast@kernel.org, daniel@iogearbox.net, andrii@kernel.org,
	martin.lau@linux.dev, eddyz87@gmail.com, memxor@gmail.com,
	song@kernel.org, yonghong.song@linux.dev, jolsa@kernel.org,
	shuah@kernel.org
Subject: Re: [PATCH bpf 2/2] selftests/bpf: Cover partial copy of non-linear
 skb test_run output
Message-ID: <ajAIdJHvvIH9ZSrM@mail.gmail.com>
References: <20260615073856.152479-1-sun.jian.kdev@gmail.com>
 <20260615073856.152479-3-sun.jian.kdev@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260615073856.152479-3-sun.jian.kdev@gmail.com>

On Mon, Jun 15, 2026 at 03:38:56PM +0800, Sun Jian wrote:
> Add a test case for BPF_PROG_TEST_RUN with a non-linear skb and a short
> data_out buffer.
> 
> The test verifies that test_run returns -ENOSPC, reports the full packet
> length through data_size_out, and copies the packet prefix into data_out.
> The test uses a 100-byte data_out buffer with a 64-byte linear head, so the
> expected output spans both the skb head and the first fragment.
> 
> Signed-off-by: Sun Jian <sun.jian.kdev@gmail.com>
> ---
>  .../selftests/bpf/prog_tests/skb_load_bytes.c | 35 +++++++++++++++++++
>  1 file changed, 35 insertions(+)
> 
> diff --git a/tools/testing/selftests/bpf/prog_tests/skb_load_bytes.c b/tools/testing/selftests/bpf/prog_tests/skb_load_bytes.c
> index d7f83c0a40a5..134be0ea8ed7 100644
> --- a/tools/testing/selftests/bpf/prog_tests/skb_load_bytes.c
> +++ b/tools/testing/selftests/bpf/prog_tests/skb_load_bytes.c
> @@ -3,6 +3,39 @@
>  #include <network_helpers.h>
>  #include "skb_load_bytes.skel.h"
>  
> +#define NONLINEAR_PKT_LEN 9000
> +#define NONLINEAR_HEAD_LEN 64
> +#define SHORT_OUT_LEN 100
> +
> +static void test_nonlinear_data_out_partial(int prog_fd)
> +{
> +	LIBBPF_OPTS(bpf_test_run_opts, tattr);
> +	__u8 pkt[NONLINEAR_PKT_LEN];
> +	__u8 out[SHORT_OUT_LEN];
> +	struct __sk_buff skb = {};
> +	int err, i;
> +
> +	for (i = 0; i < sizeof(pkt); i++)
> +		pkt[i] = i & 0xff;
> +
> +	memset(out, 0xa5, sizeof(out));
> +
> +	skb.data_end = NONLINEAR_HEAD_LEN;
> +
> +	tattr.data_in = pkt;
> +	tattr.data_size_in = sizeof(pkt);
> +	tattr.data_out = out;
> +	tattr.data_size_out = sizeof(out);
> +	tattr.ctx_in = &skb;
> +	tattr.ctx_size_in = sizeof(skb);
> +
> +	err = bpf_prog_test_run_opts(prog_fd, &tattr);
> +
> +	ASSERT_EQ(err, -ENOSPC, "nonlinear_partial_err");
> +	ASSERT_EQ(tattr.data_size_out, sizeof(pkt), "nonlinear_partial_data_size_out");
> +	ASSERT_OK(memcmp(out, pkt, sizeof(out)), "nonlinear_partial_data_out");
> +}
> +
>  void test_skb_load_bytes(void)
>  {
>  	struct skb_load_bytes *skel;
> @@ -40,6 +73,8 @@ void test_skb_load_bytes(void)
>  	if (!ASSERT_EQ(test_result, 0, "offset 10"))
>  		goto out;
>  
> +	test_nonlinear_data_out_partial(prog_fd);
> +

Maybe prog_tests/prog_run_opts.c would be a better place to cover this?
test_skb_load_bytes() is meant to cover the bpf_skb_load_bytes helper.

>  out:
>  	skb_load_bytes__destroy(skel);
>  }
> -- 
> 2.43.0
> 
