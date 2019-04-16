From: oleg@redhat.com (Oleg Nesterov)
Date: Tue, 16 Apr 2019 14:43:20 +0200
Subject: [PATCH RFC 1/2] Add polling support to pidfd
In-Reply-To: <20190416120430.GA15437@redhat.com>
References: <20190411175043.31207-1-joel@joelfernandes.org>
 <20190416120430.GA15437@redhat.com>
Message-ID: <20190416124320.GA24643@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190416124320.SRqvvyxq5dsU0UEwuhDCst5b6Sbl8EvgxGo9-fLiiIY@z>

On 04/16, Oleg Nesterov wrote:
>
> And ->wait_pidfd should probably
> live in task->signal_struct.

but this will need the additional cleanup in free_signal_struct(),
list_del(&sig->wait_pidfd->head).

Oleg.
