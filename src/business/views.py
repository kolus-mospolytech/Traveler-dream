from django.shortcuts import render

from .models import Contract, Tourist, TourPoint


def voucher(request, pk):
    contract = Contract.objects.get(id=pk)
    tourists = Tourist.objects.filter(contract=contract)
    hotels = TourPoint.objects.filter(contract=contract)

    context = {
        'contract': contract,
        'tourists': tourists,
        'hotels': hotels,
    }
    return render(request, 'business/voucher.html', context)
