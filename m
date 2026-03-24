Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A34D3DEAD7
	for <linux-kselftest@vger.kernel.org>; Tue, 24 Mar 2026 13:05:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774357557; cv=none; b=qXt/n+PBsHijK5zcD5cx6axRs0LJVkskOWLb2ck64YpZR5z2HfeMKXgvLUP+S7CdAsQHqHLlLiruqlhkaFgiDAS3bGIfhA8Cat1RC6VK8LPsyYTXsCLCZIHzyrWKRLLSsTT729kDXrtG1MhTCREYpna0Zz6cbohWaut4kqGB+eU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774357557; c=relaxed/simple;
	bh=cw7XrKGnbZgtS8pgMWwXTOKSgj52ibjy+qLdH1G/JKw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OgbGkWE+vd9buTlBB167VswRr0JtSkFXbe0QmLkAhEEZ/HADSaJBFti5CZAUPPX6wwUtlBi2QHHP6MwknNV+KnAIohrESDKux6QAgnq4qtD5frVcSl1a53XcjU/ZxETjQmCDL979klsLQNR9qd7zCZodb8aFKFYwRp3uX/2uR2M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=resnulli.us; spf=none smtp.mailfrom=resnulli.us; dkim=pass (2048-bit key) header.d=resnulli-us.20230601.gappssmtp.com header.i=@resnulli-us.20230601.gappssmtp.com header.b=oVZK9Ujd; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=resnulli.us
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=resnulli.us
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=resnulli-us.20230601.gappssmtp.com header.i=@resnulli-us.20230601.gappssmtp.com header.b="oVZK9Ujd"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-43b48ac2727so943704f8f.3
        for <linux-kselftest@vger.kernel.org>; Tue, 24 Mar 2026 06:05:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli-us.20230601.gappssmtp.com; s=20230601; t=1774357554; x=1774962354; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=cw7XrKGnbZgtS8pgMWwXTOKSgj52ibjy+qLdH1G/JKw=;
        b=oVZK9Ujd78g0Pee4oP9+FcW9HkdDEYJlXIyPt7P9zsznQ7tleTZLYqY9mZpwaNfzcD
         vvd5aGwpceZu+h2owPWJYqbCYZZxib7wkxYkVWxOIsufLK39khk9o5FTThQN8Qy4y5EB
         YiA1V8w7YXUDiu4bLWsRK1GOKGWGfvL8HT2JbtpIc2RFfRfwwuaNZ7kHgLgWCCji5JEp
         b0Og8mAZ+oawtXJXusLXtQCwbNUoEitcpGdW+c9bhFm1ixUmksiyxLs2lKlRYxMByLM6
         WpexxVihYehx96+g2pDgi6wXZz6yZ1ELRpkNpOX4mncGvmyZyUk5HZtTToHDDigLmrPk
         Wj6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774357554; x=1774962354;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cw7XrKGnbZgtS8pgMWwXTOKSgj52ibjy+qLdH1G/JKw=;
        b=T9CMsxWJIgC8ew9KQ+YOCw9hZRX9dyDmPzS1c90wC/GJ/NeYjvztAgnitL7D+XdyOS
         V4u7gDuG5gMpIHlMLwZIM7Ia0Z9lH8m+V/SP3unXdGTewu/lA2BUJ+pUZ1YDZEmdCXwO
         KS1V1DFuqES2T2MDOidi8MG9NDA+WuwQQqM6vhtkWFPzJbDxai4NBe448Ec3T+i/cFAY
         u7w7KeG/uyruGEVtaXoM8aEBMjZwIOWvq2s2hq3J/yCajKWyb7CcSPSkr8V2OK3vuoJb
         XUDy9+sNcldZh+xS5KzXRRIHPhKE96d3zpb1krJGTOug8mPqhYd/i3J072HbpTxh6kJm
         PY+g==
X-Forwarded-Encrypted: i=1; AJvYcCVVFp4d1mO3HkP8zJhHpru1dNgYZPzb6OiRbOuJG1YPURavvHZYJB3uLrEiJH9lCaDGqneUfZIJJjJ9EowoPiQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YweWDFblFJ7xxXTwl7k8dddmoEOgsL/rHLaJmri4eZEKFLDGX6b
	mSiwsQFqZabsnVeQceT5wRJhoOpp6gOu8fKBN+bCOXFArrq/scqH9hAIUMhJFK19yz4=
X-Gm-Gg: ATEYQzyL+SzsRAFRo7c6PUpaHn4F8Ixq6kh6KVE3gSOM+z7XeSN8gOSoidiyX3Hnpha
	VAumNOb5Huf+hXTnYZFY7gd+X5QO45vguWDm0JV7deeRjq6d+DQ4HX2jzec7jWwwaqnZ/Ah1lI+
	hlA/emozstbsf0LsejluCS3v8K9yxfnlxA6sSQS8ryZDiv8BYy9R7RQAsuxJVpLcNWfuy4oUTrx
	4HOpRmHtpI59/H4BTW6NeuRNUzzGRXk8SdbhrA+XvbQajJ7RQSL+WCuVrBihFtmrO1Sv9jcWchO
	gp1Vl5m7N2ib/ZB/mzNF4fLPwhykcAN+TZa58N6FFg2AF7ctMfatDFY3ihNoBBddNTZ8wiZOWJK
	16sha+AUmeoT9TKTGPnO3/DnAeO/HGebaDMdDUyTi+NuWgQUbqZEY/3EUzZ7+oPXlMnWv/i62vV
	KW12lJcyQnjrdXUOxjxhv4EfLY2eOD6W3aZuD8fcpVCDzLiw==
X-Received: by 2002:a05:6000:26d2:b0:43b:3d4f:e18d with SMTP id ffacd0b85a97d-43b64287044mr25237105f8f.39.1774357554406;
        Tue, 24 Mar 2026 06:05:54 -0700 (PDT)
Received: from FV6GYCPJ69 ([140.209.217.211])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b6470f902sm39989765f8f.28.2026.03.24.06.05.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2026 06:05:54 -0700 (PDT)
Date: Tue, 24 Mar 2026 14:05:51 +0100
From: Jiri Pirko <jiri@resnulli.us>
To: Tariq Toukan <tariqt@nvidia.com>
Cc: Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
	Paolo Abeni <pabeni@redhat.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Donald Hunter <donald.hunter@gmail.com>, 
	Simon Horman <horms@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Saeed Mahameed <saeedm@nvidia.com>, 
	Leon Romanovsky <leon@kernel.org>, Mark Bloch <mbloch@nvidia.com>, 
	Chuck Lever <chuck.lever@oracle.com>, "Matthieu Baerts (NGI0)" <matttbe@kernel.org>, 
	Cosmin Ratiu <cratiu@nvidia.com>, Carolina Jubran <cjubran@nvidia.com>, 
	Daniel Zahka <daniel.zahka@gmail.com>, Shay Drory <shayd@nvidia.com>, Kees Cook <kees@kernel.org>, 
	Daniel Jurgens <danielj@nvidia.com>, Moshe Shemesh <moshe@nvidia.com>, 
	Adithya Jayachandran <ajayachandra@nvidia.com>, Willem de Bruijn <willemb@google.com>, 
	David Wei <dw@davidwei.uk>, Petr Machata <petrm@nvidia.com>, 
	Stanislav Fomichev <sdf@fomichev.me>, Vadim Fedorenko <vadim.fedorenko@linux.dev>, 
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-rdma@vger.kernel.org, linux-kselftest@vger.kernel.org, Gal Pressman <gal@nvidia.com>, 
	Jiri Pirko <jiri@nvidia.com>
Subject: Re: [PATCH net-next V8 01/14] devlink: Update nested instance
 locking comment
Message-ID: <owfpttw4n7ft5gisy4gvmd7z22hcafjlcr5i3e4t22j4w3rgz5@drxvpqqmiuen>
References: <20260324122848.36731-1-tariqt@nvidia.com>
 <20260324122848.36731-2-tariqt@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260324122848.36731-2-tariqt@nvidia.com>

Tue, Mar 24, 2026 at 01:28:35PM +0100, tariqt@nvidia.com wrote:
>From: Cosmin Ratiu <cratiu@nvidia.com>
>
>In commit [1] a comment about nested instance locking was updated. But
>there's another place where this is mentioned, so update that as well.
>
>[1] commit 0061b5199d7c ("devlink: Reverse locking order for nested
>instances")
>
>Signed-off-by: Cosmin Ratiu <cratiu@nvidia.com>
>Reviewed-by: Carolina Jubran <cjubran@nvidia.com>
>Signed-off-by: Tariq Toukan <tariqt@nvidia.com>

Reviewed-by: Jiri Pirko <jiri@nvidia.com>
