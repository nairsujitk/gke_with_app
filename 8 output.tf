output "Voting_APP-ip" {
    value = kubernetes_service.voting_service.load_balancer_ingress[0].ip
}

output "Voting_Result-ip" {
    value = kubernetes_service.result_service.load_balancer_ingress[0].ip
}

