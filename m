Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 734743D9DD4
	for <linux-kselftest@vger.kernel.org>; Thu, 23 Apr 2026 03:57:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776916647; cv=none; b=oXSBdjs1IOLqiv/8OUqIg4hchA/Y/piSTmlQLEZTBZsI/LtmgYFpXsJ4hzqx7zFsItREq9XT/hhKvPpBqcEU5JVy8XbetlDV3PTimUwQTAjNNUYUOhqPd92+YWpCQdpdC8Am+LMTWvomMBmySWWhEygegqVIUlUbpJ9xKZgwIfQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776916647; c=relaxed/simple;
	bh=hov8j8OBBk6KKCciup9KzW5pzA21qGDmu++kv8kz8Vs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kC3CyImJKMoadhRFY0mfkeGFDMJ1BdUR66JHhl4PGGBTo4/zU37tEgEK91euGezD+shaQiUI4q0ABzPG15/UmnxbEfHddBQh2ZjW/oHuFGVlu7cU7xxdltRnrsnhscuUjOr0KnLG/Mhin39BwygTsOMbUsZeYahXvHGNL2VC4T0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IHHppME7; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IHHppME7"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-43d7650202fso4770796f8f.2
        for <linux-kselftest@vger.kernel.org>; Wed, 22 Apr 2026 20:57:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776916644; x=1777521444; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=LOKAMPFZKUfzrB+GANZr413WPPbfCUJLAABtk6nlwSk=;
        b=IHHppME7CevXx1gUrGPhFt7gkSCIXj6p/0NPnFwCtWJ8cqRbBmHsBWXlVkhkXN5X2V
         ZPnChqnqnVaAJ7npJIL1KrJRghqU5Ag5HOy7YjPYPSkx4OlHEmQnMj+Z5hzanpDNJAWl
         rvDs5cSJKVeDAfML/+mfR+EfTBdxqQbXyrqJe/8gPS8GiVieozDoVbMnF33oA9jM1NjS
         wKM291QFP+JdwGsV6ALojDv65PFOV0/BlIRgzGmTJCB+0KcVvBFP9IlWdbTvOzEPLX/q
         oF8K4X2vU2+JUSLPWDk6nDhj9+CKZNA0rNlivzS5ifIae3ktcSPd6YQs2VJoCOnfCJHT
         KbiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776916644; x=1777521444;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LOKAMPFZKUfzrB+GANZr413WPPbfCUJLAABtk6nlwSk=;
        b=Nk9ENW3TntajD/NrG+WPdGX1RSFy25Is8BvKdQwjrZFgG6JdmVtgz86PIyx9ctoQLp
         r3CFz9gkkqO2BhXdy0SzJQqZVS3DFW+Y/NJwve8iV2DMnHMOCl0btuEGFlxdPUt3d9Ia
         qwBeHLEB6HQKdKf2GRmlQ1dN9lFwAH7naiyjIqq7CPqxokbE9t4iy7T28e4BSAfmN1Kg
         +ZH1VUZVCqGwL1YY9W4FEfCr9lgj9vJ4uJBbyBYQee3aE/1YnhR5PW/bbMaGyza+oy9u
         WUHoJoSTBf8doA/s0vrm6lD9cshaACeNgR4in4PHBV+kcGIyPkqFFmvvpxIuszS+CDMM
         yD/A==
X-Forwarded-Encrypted: i=1; AFNElJ9SgiIyiCbXvudRQpRW9anQF14qIFTdIZWgU0Cz7wtwYE8Y4JSUZq8s+TXtaDTW9ZglhdQk67Tk7g4qrPUKxo8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx44f6qWPpmRBbKrOua6gzvjAFTY04dGTp6KTucUnuiX9zopTHo
	4NbGr7lWDpxtRDxV9WAfiqE6BEYuwRUh0PKSRIEanpkzQk2YJ6LRx2A1
X-Gm-Gg: AeBDies9oD1DK0paxIRH2lrGlfBsQAUpPxye2uChUojqC1ssSGY10nK8Nk/IBsJsfgd
	fkgwWnmcYzMQh9MGDFxLtkoA5MFCX+tbOfGCUqmNNZ4sxSKM9adqjnAlRo8xXlYITMOeitPQvtf
	0q2O6BelCGzDVXkaY7Bs+QzJp5cn95GBS68v+Pj30TXECceG+C3XFYNGIkCow+RhkjnQb+VBpL/
	XtY8KwaYAn0G+1T99sAU1LZjr4VG6TfmmZppb4Piy15ZGQ763gRQlsW2QKrd487wM1MC4E19Nhu
	PGjXXQrHBOVqulqFqXXxJN0j5oxB3xpSoWldGmHx8KoMTfdSFMEe6K8mE3/jITlgUQ7EOxLbnFW
	p8PObp2bsPMNG7OEDYg4G8VdI96iwYvRWhfUj5BbaRpGQAKYe3POK0dDlv1M8NK17xgHSw9kVyh
	14SL7hxhVKYDBD63T9If7iT1eJpde6zj4hia4yIqnOaFhBK9l2O9Hcsb59VqegoqpgbcdMoPqAq
	x1hRpk234lZVlRkw6p+imZosjrWDQ==
X-Received: by 2002:a05:6000:178f:b0:43d:2be:e4e with SMTP id ffacd0b85a97d-43fe3e23d1fmr39055753f8f.46.1776916643703;
        Wed, 22 Apr 2026 20:57:23 -0700 (PDT)
Received: from fedora (185-147-214-8.mad.as62651.net. [185.147.214.8])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4412150a071sm14978481f8f.21.2026.04.22.20.57.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Apr 2026 20:57:23 -0700 (PDT)
Date: Thu, 23 Apr 2026 11:57:17 +0800
From: Ming Lei <tom.leiming@gmail.com>
To: Caleb Sander Mateos <csander@purestorage.com>
Cc: Shuah Khan <shuah@kernel.org>, linux-kernel@vger.kernel.org,
	linux-block@vger.kernel.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH 2/3] selftests: ublk: enable test_integrity_02.sh on fio
 3.42
Message-ID: <aemYndGj2TrYl7MG@fedora>
References: <20260421200901.1528842-1-csander@purestorage.com>
 <20260421200901.1528842-3-csander@purestorage.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260421200901.1528842-3-csander@purestorage.com>

On Tue, Apr 21, 2026 at 02:09:00PM -0600, Caleb Sander Mateos wrote:
> fio 3.42 was released with the needed fix for test_integrity_02.sh.
> Allow 3.42 and newer in the fio version check.
> 
> Signed-off-by: Caleb Sander Mateos <csander@purestorage.com>

Reviewed-by: Ming Lei <tom.leiming@gmail.com>

Thanks,
Ming
