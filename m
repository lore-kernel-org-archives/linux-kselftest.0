From: davem at davemloft.net (David Miller)
Date: Tue, 15 Jan 2019 13:45:35 -0800 (PST)
Subject: [PATCH net] selftests/txtimestamp: Fix an equals vs assign bug
In-Reply-To: <20190109105007.GA14518@kadam>
References: <20190109105007.GA14518@kadam>
Message-ID: <20190115.134535.1816196657240429744.davem@davemloft.net>

From: Dan Carpenter <dan.carpenter at oracle.com>
Date: Wed, 9 Jan 2019 13:50:07 +0300

> This should be == instead of =.
> 
> Fixes: b52354aa068e ("selftests: expand txtimestamp with ipv6 dgram + raw and pf_packet")
> Signed-off-by: Dan Carpenter <dan.carpenter at oracle.com>

Applied.
