Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33E463AE71E
	for <linux-kselftest@vger.kernel.org>; Wed,  8 Apr 2026 09:02:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775638979; cv=none; b=Et3sRt85xzLokOuF+H0eXEdpUIpQaM0tqnuFp5ogl0oQk0cvTcbdwGisDF5NmX4r5MVKOjn3M6KTWOYSfpvFi2IMdiJp/H0fE6rYviHT6u8LC1NVy2Ecd3Z9tLCcTYbaR2jVLZHxQwhpb8UT3uTruA67QlEfHeTLjpMOq5UGwh8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775638979; c=relaxed/simple;
	bh=5Wfzx0JvV5+lRKYwOJCGvqO/Gl5pYo/UtDK9cUzJ7/M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OqETmUEy3gcXRUwEAd8Vhix6GAuY8ACdGaGqIk/swmeDOegl0ey7kimQcx+xin7DM4QbRq+qUchNrpcdRvilkZ6PBh1sQqOo7vqdwB7XnTGHdJAFw5Bt7Ignvmw8zKQgMXVlpKOKMalBHYjX9j0sJd4bciFlAlmWqsp29A/Dl1w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=resnulli.us; spf=none smtp.mailfrom=resnulli.us; dkim=pass (2048-bit key) header.d=resnulli-us.20251104.gappssmtp.com header.i=@resnulli-us.20251104.gappssmtp.com header.b=gt//kcau; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=resnulli.us
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=resnulli.us
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=resnulli-us.20251104.gappssmtp.com header.i=@resnulli-us.20251104.gappssmtp.com header.b="gt//kcau"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-488af9fdaa7so18468875e9.1
        for <linux-kselftest@vger.kernel.org>; Wed, 08 Apr 2026 02:02:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli-us.20251104.gappssmtp.com; s=20251104; t=1775638974; x=1776243774; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=5Wfzx0JvV5+lRKYwOJCGvqO/Gl5pYo/UtDK9cUzJ7/M=;
        b=gt//kcauhKw2s1EKOxKxq2VyaPN4u4GwCIj2H55QO7N5/zBkYHu2+rYp/sln4GhD7l
         DVr3Y854XD+k0H0MACpUOVlRqOso46HfSxnYpKPeJ8U1FpTey01lwXrgWBjmEv5tS2+Z
         I4cr3qYXqAcde+pClFgmTpmzufrzejdbYdnbtEVOhnLH6TMkfT0Y7hdP5yXyBrJ9mme1
         0iwLNYjXA4V+YHuECBhgGvJEEtP8ejTA58wqtk4TQLsW4lbNU1IQS7JOCnkZdgX4TWmr
         dcml+VWqrIO7ghkq0NgKg5uE+WeslivrwNvWu+JQt+TjT/BQrM01b18AWVNMpkmkTPTw
         cqHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775638974; x=1776243774;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5Wfzx0JvV5+lRKYwOJCGvqO/Gl5pYo/UtDK9cUzJ7/M=;
        b=e2ZqT2DDVUapDkeHiwZwLvuH/Uh9eJwjYkLepEUXkl3G2TcWnITcaaxe0sqWpfc3jt
         7bNZM6ayH32wfXdzbb7vJhxvDZoQSth/r4f9LOXjN3ecLixEqXWPgaRdlvPQ6Dmpouv4
         hNYvOYxlGlvVp+0tQ60q6LXg5hQX8Y9WHld6BzfQe75x9OG9iMoMHH0GEokZ895MRv7b
         TOsl+rp7Z4rJnjFyW7A54SsFbeAatxwZ4BFQPcRAAn57vJXqI4e02I7SQfCGTV3lBy85
         77MEX8pM+nYQT5eaKYwG+dfelgvI56texlqzeluij8/R7etg1DbzlRtcoTlN8gsfox20
         JE7Q==
X-Forwarded-Encrypted: i=1; AJvYcCWwPsDyOomgPUYDcpumcmnzmxHmtaMtCbl5tjQxjgZIbPR1KM8J53iim0CVbVeuIyXdcuDP6DvuD9eCXdHukYU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyy5s+4yA5KfWGM1fBDbXZG0BbpIJm98Hnz3gOx58Rp36gYEFBj
	ziVNDX4vVhMz8oY13cWpAbmhPUA7QHy0KIM4UHf9x6qZqOrVOLUqXe9jSt8RGPFbsFY=
X-Gm-Gg: AeBDietfKL0KsNM067NP7n1NleQF5+VUZj1izBlM8oA6zBacPcX7sDXuULcpE8Dk3yf
	o1YL+EilTfbmd5eyHX0C6yxpqruW9NAfu3DYTxLkxAy2+XyzcYTdEjsDx0Q6KaAfRpk24psuCfU
	a3n+aUruuUgkzz6vsiTj2dINkhDWSjYDhaBBdT+3Lw/AE8CJ/ZVnANMsMRt4ufxiOeQ04N1qaJV
	+Gdaum+zSq4LAUj8c+fBkpFS5ignQted1CUg50Jmt/kxmkJC3WXHA5seBd6xaOyDm+S/tPDXp07
	filfYc6JfkqDLvKmUi8cSbiDupKF96EzdGM/aWE/GLZFR/q4AU6TjxcgBYyQ3F7D0PYIllay3u3
	FeBfcWqqMC1EAmXx9fizs5qSEbeqYkDoR0BiRU3yeddY1tHZqoenxBTUGB53VpS3A53EBN35bG5
	SMFg5SwmWVt94RmwdyUtwv7DCnMoaVTtM=
X-Received: by 2002:a05:600c:64cd:b0:487:1fbf:e0bb with SMTP id 5b1f17b1804b1-488996a1c9dmr293324265e9.6.1775638973594;
        Wed, 08 Apr 2026 02:02:53 -0700 (PDT)
Received: from FV6GYCPJ69 ([85.163.81.98])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4887e83e906sm700342285e9.8.2026.04.08.02.02.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Apr 2026 02:02:52 -0700 (PDT)
Date: Wed, 8 Apr 2026 11:02:50 +0200
From: Jiri Pirko <jiri@resnulli.us>
To: Marc Harvey <marcharvey@google.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Shuah Khan <shuah@kernel.org>, 
	Simon Horman <horms@kernel.org>, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org
Subject: Re: [PATCH net-next v6 03/10] net: team: Rename port_disabled team
 mode op to port_tx_disabled
Message-ID: <6imn7whkj7rjg7ql57rlm6u2wv5bdt6a7oxihmyphfhtubht2u@yu7dubtqxy2a>
References: <20260408-teaming-driver-internal-v6-0-e5bcdcf72504@google.com>
 <20260408-teaming-driver-internal-v6-3-e5bcdcf72504@google.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260408-teaming-driver-internal-v6-3-e5bcdcf72504@google.com>

Wed, Apr 08, 2026 at 04:52:22AM +0200, marcharvey@google.com wrote:
>This team mode op is only used by the load balance mode, and it only
>uses it in the tx path.
>
>Signed-off-by: Marc Harvey <marcharvey@google.com>

Reviewed-by: Jiri Pirko <jiri@nvidia.com>
