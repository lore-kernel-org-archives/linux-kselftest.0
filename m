Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D39B33C4161
	for <linux-kselftest@vger.kernel.org>; Thu,  2 Jul 2026 09:05:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782983116; cv=none; b=gCmhshSm+ssXkrp30WLVu0yBuBIeHKfUeWOgXe2NltGVW16olitPjPjm/kZ+RSbP3+/NbFu8wfkB3RUR+Hb/IaxQHLiY79ge0vZqwVPAsYkkKGRg+IW4Ao0yYO76VHHYOVuTJJzHx82uQWNL/u476T1vlwYAhvcnAkGYNkDN+DM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782983116; c=relaxed/simple;
	bh=1wX+Oc7KLHnXLghNaOjRIzBWrebHuANifYCxyiNRkYE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CSQDC4FeIeeWm7gRc5VHx+Q8tQlB9BOl/K9JW9q2iJ+Nkwvs/GGJW7wtMYekdexYJlhURqpPkStqq1qcvz1ImD7mUf3qkEPIwbgC57HSoZTDd2cSI44huLACeNShczDPb55cgRa/N4Q1VjAoSs5ciL+OJW0+tS24RGpfMCegJ5s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=U7C+FvIH; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="U7C+FvIH"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-493be1b9564so11476185e9.2
        for <linux-kselftest@vger.kernel.org>; Thu, 02 Jul 2026 02:05:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1782983113; x=1783587913; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=hmuUhY+/SyHoulYX74aD4uP5B6Iz9sPzf0IAjdpyq8w=;
        b=U7C+FvIHhc/DNBsoKgCXnLRmJVoc31wWQCHHW67Rs23rPeYT1t6PM3tNMjTChc7qj8
         ArAb0uZnVzUENoxzpNExlGab5QSNQNX6FkfSy0p6kzBRItmJiaob2DiaFtaDFA8N1mKi
         DReWg6MuOiB3u2tvH6SDwafZmrUDw249+WOAy63KLJBFH/9V47w5eHQHO/iq5k2iHZh0
         BUd+NwvTPEfo9YF7U5AjKTLEnngv7fknoPUa7HBu0MKsQ3ObFyBa8XEfUQ48dUxgmtIL
         qoG5w+FykhVUye2d6gSrXLGBRrgaUp/rPEltWmShwJRYx1ueW79EIuL7BhDaTa4xsBX1
         9F7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782983113; x=1783587913;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hmuUhY+/SyHoulYX74aD4uP5B6Iz9sPzf0IAjdpyq8w=;
        b=BL5PkLOBTbuyTCuqkfHYMbzJaj7aAULKcRriMz1sSang8Twd/+FOTaav5HMPvujFRY
         yPbV3SCNdvmaZ44WJjRlifDaermlASGyCouH9FMR27KKPWHNHYG4u3WraiN7AQbupyyt
         19d0h1TjPs6kFKl+nXNuuYjpIjWQ+sg23MfdEnjUiCx2iUJn4QPHMOKGfpj/7phfrPnS
         7/BuzLycWoJe2gZd3+oX2gmfwSm+P8c7Dgn0Jlxbcn77nH8Y/h778akziGtboy6U6fMI
         4e8uqJoDwu79+7d4dI+Zh7leN6zz3C0HR/7T69N2Bz0Ve+REAhsdvDDCAbIHSKv51tbc
         AqIQ==
X-Forwarded-Encrypted: i=1; AFNElJ+4X/Y5gDpt72k4bulvnH+97cXkFJkMhlm4bHQGI5/BQKXTCNN9YCCwOOD2CkhFxGTX5XAkC8/nqOq5JS2QPog=@vger.kernel.org
X-Gm-Message-State: AOJu0YxqGqEIM2pOH6xiIROxwKjxKgMfqpKu6sA8IxO0iY/cvEVP5KMk
	0CEMyltWcGmy2U6Bpu+pVTLdt9kZyne/pRQ0GL2zLDsrk6pVQWoCEMM+RM+bVqLI9Q==
X-Gm-Gg: AfdE7ckq+m3GJlqUm4IFiBZNPCN9SPBl5lZs0WEWpX6dRhYnQeDlsUKBLhUtfmAfkbc
	L4mekDsmiaXsMW4LET92vc132/bykh1TuP1MhIcwAlqVDrxM8jTL0rCtlMBPSj9dp5+odgSJBXH
	dnNYBghzddD5xxET2B/kGHbHT02O4ozwx8VrdhRliC1wrYtMT9XfTw9TFv+zeCAMmSendTCNOZR
	T8U9PIJG2UpKmiqk7WLaAaVjf4u2+KNoe4y1bylK3zOjzzVis9F4YlgDNSq4Mj9ObR/H/X7UIK6
	gyOBAzge3DjbJXVMHdkdzi5jPUnArQeRbcWn/WUawj7LyU0dTPJfrz9F5RjxQMx156FnDj6S5Eu
	8T/VBjD1iPB2s+l/8X4XJuCArX6tH7ho7p64rfMWfFXc9EhM+x6bhbLAfD8P6WGKlcC3CL1dExc
	lryZA01kvYTcNLh0hUFeW3Yr30epsDH6dPFfWfN2Fm07jJw8tghUTZ
X-Received: by 2002:a05:600c:4e4c:b0:493:a909:8c71 with SMTP id 5b1f17b1804b1-493c3cd58a7mr58223075e9.7.1782983112525;
        Thu, 02 Jul 2026 02:05:12 -0700 (PDT)
Received: from google.com ([2a00:79e0:288a:8:9765:f926:b0c:82f6])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-477dd94cb59sm7450027f8f.18.2026.07.02.02.05.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 02:05:11 -0700 (PDT)
Date: Thu, 2 Jul 2026 11:05:06 +0200
From: =?utf-8?Q?G=C3=BCnther?= Noack <gnoack@google.com>
To: Wang Yan <wangyan01@kylinos.cn>
Cc: mic@digikod.net, shuah@kernel.org,
	linux-security-module@vger.kernel.org,
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] selftests/landlock: fix spelling error in fs_test
 comment
Message-ID: <akYpwjtjm4iuKv5Z@google.com>
References: <20260702015823.368529-1-wangyan01@kylinos.cn>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260702015823.368529-1-wangyan01@kylinos.cn>

On Thu, Jul 02, 2026 at 09:58:23AM +0800, Wang Yan wrote:
> Fix typo "allowes" -> "allows" in Landlock filesystem test comment.
> 
> Signed-off-by: Wang Yan <wangyan01@kylinos.cn>
> ---
>  tools/testing/selftests/landlock/fs_test.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/tools/testing/selftests/landlock/fs_test.c b/tools/testing/selftests/landlock/fs_test.c
> index 86e08aa6e0a7..e672089e9329 100644
> --- a/tools/testing/selftests/landlock/fs_test.c
> +++ b/tools/testing/selftests/landlock/fs_test.c
> @@ -6927,7 +6927,7 @@ TEST_F_FORK(layout2_overlay, same_content_different_file)
>  		ASSERT_EQ(0, test_open(path_entry, O_RDWR));
>  	}
>  
> -	/* Only allowes access to the merge hierarchy. */
> +	/* Only allows access to the merge hierarchy. */
>  	enforce_fs(_metadata, ACCESS_RW, layer5_merge_only);
>  
>  	/* Checks new accesses on lower layer. */
> -- 
> 2.25.1
> 

Reviewed-by: Günther Noack <gnoack@google.com>
