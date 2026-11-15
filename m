Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794708467;
	b=UVEztIiL+UlOVneJAKc2s81G6TLGJtazQb/NhH68cu1aVb1AnBsXMKIeQieqR3rZ/fmy
	 IVnehrUX/p+EUutMg7K8MbJ6BxVMQWM4ZzV0e9SpvluujBmdJaceo/hTwl5WtZfJr2ib1
	 TW39YQkKIzj5VYLxccAawyRSX7dvqTkLG5Jy97LyifsG028GnrERnbmbw1jHniHMSGJ2D
	 7J/3xuzcXEgnmKJM4GTb/hBspdrrq44PcCjHajEEwnI9ztLxG/1JRmevYC/1dipwYmzQJ
	 5k818GV2tvL0IkBT6QrT+5ev791xJJoCZnt/OEXtFxZYZ57OqV99nrN7NGMzX+TCCHA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794708467;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=rnqu5ao9YJwk94NMnB9wLTZ5Ww11Mzaq96WX6a9SCys=;
	b=AwlNND1875PPsAgpe9rtcmuikHczUTa5SfmffrIuop3iOLiBDfFY37D/RNFtU7BPzT7Y
	 IqtzMCNxWkMqd1cnIPKHguxd5pRkBRwDKM97GQD1D6wo7TZK4HnkDVt9zqWOujtTpUsDb
	 gMXWJw8P3Z4/pg5mNus9fsmEPc9IedNG/gY9FVBoBQOkpGDe9toIikhgupMXjkijlravc
	 fHZcB4ndkqHsiylE8XN6ztXaIffjlM7ULgsRi4SPOBqDRFfIt1SWLmJ65FikmUp8brdsh
	 c6oWlM1f5nxgDEf4/L3bmw5ya1KqK5aLH/s5worD2DHaIPFUhrC1DUNM9WbwHWqySYw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hLnlNQK8;
	arc=none smtp.remote-ip=209.85.210.48
Received: from mail-ot1-f48.google.com (mail-ot1-f48.google.com [209.85.210.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA8E3606A329
	for <linux-kselftest@vger.kernel.org>; Sun, 15 Nov 2026 02:07:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AA8E3606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hLnlNQK8
Received: by mail-ot1-f48.google.com with SMTP id 46e09a7af769-862b76e3c8cso71123a34.1
        for <linux-kselftest@vger.kernel.org>; Sat, 14 Nov 2026 18:07:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794708465; x=1795313265; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=rnqu5ao9YJwk94NMnB9wLTZ5Ww11Mzaq96WX6a9SCys=;
        b=hLnlNQK8veP334z+eVkUDAES3G1yQmoS+IwKg8o4QOrZ6P44r8AkjMZlynKd27RZbc
         p+nb1wVMj174+IPPxl8ZBp7Mmc5FGxR09y5xaFBVcsIF2IQaee1ma6hxIbz88svT+mr5
         SyMgE+EeIY8vD06U/mS1vcAuJz4LjrTAHL6vptfjVDeAtuat+fAIJPECALmQi7y9O38M
         BhwxmXVSzb7x5q4nPK3ol/34LXAE4t3yqVJf97ZATIecE+cbI1sOQjsLhYaURc6YgJuI
         vV/WeenOkKeTh4I3Vqb081WEucdnNXZ3sgcwyW30M3qGGscFejT1hmq2KswuO8nwqZgf
         2y1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794708465; x=1795313265;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rnqu5ao9YJwk94NMnB9wLTZ5Ww11Mzaq96WX6a9SCys=;
        b=mh3LvNHlOGApqb276IABkF/2nNEUW9zhRkH8sgdnot0rdHGzt7ztVfXsbO8w/w3vRi
         /chMAHbv6ZnwToEZwiVUe/Cl8oAUPXNBiHeC6lmNHjEo0m9cHrmKS7I48m643/djr0cE
         N2KM1KEKCTnfhWXGJzmflVMF0HyxUk2QuH+aKZW3+LTp1JZhhV/GFLSY7Js3gu0THKdY
         xmlhwFP5cYJ5TvUTxNMqKUChWj2WUPGqV2yN+FCj1sPbLkkc+lq+rYT5OHZ3ch4ljD13
         j/tasAuWYJHhDTtfaC4fawNXNUnnIwht1/cH6iasBfdmbGHILcbbSafEOGP7fqwGFenT
         hhlA==
X-Forwarded-Encrypted: i=1; AL+hErHj5SRScsngljjvPKFvPV5KFl+WubO0M3yeQBS9D3h371YZWmlltdNZ3ZXU5lX6KQeS5WhkTxSsxhJLHDjBxwU=@vger.kernel.org
X-Gm-Message-State: APuU4Z+0wPCbrl6ceuYa/SpcFZvoqaUvPYUZqkYm/Yo/YaECRVnl90CM
	JGRHOuAL9mhUyj4TYqGiGh7QoA6Zl9NHAtk6HdRUYyBI7phdd5X+szO7
X-Gm-Gg: AYBFou0cBTf9jv1LeA/5FZjYm3HB92Z2+e/aKBb4cbARqJNS8Ux4CBe8xec7zlZqipS
	FONEm1VLm1xom3ZaB504BlTDahyBhPkmR6ZhSzIeCxLjigq3RrNRknpe+96PuhqhISizqcCpEJv
	sJZiJ+xVe16kBcIgHiNYCDcFSf5EWD+3yDVIynoqOPnAy6MoKgJAk72hus9Ly7URANGCjfTiiG3
	kyFnmWW65eFNZ3ErRj74E8a0HzA83uVo7Qmt1Qu5O8T0KFmrmRuERF4cE6wKQMS8Hg7y7JB0Jas
	X5tKIE4Uuyb/qu0PrMGbcBwzHHiNELMk7DEuE4oLipPQ1bNUxeQNSnVSwZubDbd7+x48AwkKtYx
	eIfwcripkwxmi5GkeAr4wC5Vx7RsFSLS9aNXihnzmCWLmALTI+uqJ/CFKeVBuXQ41hpNuisyP5s
	xAxWw7LrOBbtKpfa/65XyHQeKYJm+wzIhRY821h0/uRZxXqIzXxioOd0x004GR43v7EVM7unyIS
	JgKeF7X9HX6u3bihobH/7CECyBcoTkJ0f9m9aKPmvVizxo3mY+051T/KeoEvW7UWzFDizgr5B8e
	fcgeTCpK2a3ZFEiySNzY+Sm3biRNPVMhRaKeUDwk7qM4mjqM43NpX8H/41qOS2cdFqM4VZqRspo
	4827l8ipRdFHa4XE+2J35/k0WLKmIT9hU
X-Received: by 2002:a05:6830:4104:b0:822:527e:f653 with SMTP id 46e09a7af769-862898681aemr7487703a34.13.1794708465542;
        Sat, 14 Nov 2026 18:07:45 -0800 (PST)
Received: from fedora-laptop ([172.245.82.59])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-862880a5298sm7113595a34.7.2026.11.14.18.07.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 18:07:44 -0800 (PST)
Date: Sat, 14 Nov 2026 20:07:35 -0600
From: Ming Lei <tom.leiming@gmail.com>
To: shao.mingyin@zte.com.cn
Cc: shuah@kernel.org, linux-block@vger.kernel.org,
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH 2/4] selftests: ublk: propagate stress worker failures
Message-ID: <avkT5yu3hJgi-YWb@fedora-laptop>
References: <202611112257529855AMDZLzg8ZmFDQ3fBstbi@zte.com.cn>
 <20261111225759742pwhACD8p_0GdXSYIk_Ob6@zte.com.cn>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261111225759742pwhACD8p_0GdXSYIk_Ob6@zte.com.cn>

On Wed, Nov 11, 2026 at 10:57:59PM +0800, shao.mingyin@zte.com.cn wrote:
> From: Shao Mingyin <shao.mingyin@zte.com.cn>
> 
> The stress tests update ERR_CODE in background subshells and use a bare
> wait in the parent. A worker can therefore fail while the parent still
> prints PASS and exits successfully. Calling _show_result() from a worker
> also removes backing files shared with other workers.
> 
> Generalize the recovery PID collector and use it to wait for every stress
> worker in the parent. Return errors from the worker helpers, leave result
> reporting and cleanup to the parent, and reset the PID array after each
> batch. Keep failures ahead of skips when collecting worker exit statuses.
> 
> Fixes: bb2cabf23568 ("selftests: ublk: run stress tests in parallel")
> Reported-by: Ming Lei <tom.leiming@gmail.com>
> Link: https://lore.kernel.org/all/avJ0Vn9G7XhZv-XL@fedora-laptop/
> Signed-off-by: Shao Mingyin <shao.mingyin@zte.com.cn>
> ---

Reviewed-by: Ming Lei <ming.lei@redhat.com>

Thanks,
Ming
